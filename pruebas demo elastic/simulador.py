import csv
import time
from datetime import datetime
from elasticsearch import Elasticsearch, helpers  
import urllib3  

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


ELASTIC_HOST = "https://localhost:9200"
ELASTIC_USER = "elastic"
ELASTIC_PASS = "XtuAYzBGP23LW2GoCyAb" 

INDEX_NAME = "logs_csv_en_vivo" 
CSV_FILE = "E-commerce Website Logs.csv" 

PAUSA = 2  
TAMANO_LOTE = 50000  
try:
    es = Elasticsearch(
        [ELASTIC_HOST],
        basic_auth=(ELASTIC_USER, ELASTIC_PASS),
        verify_certs=False 
    )
    print("--- ✅ Conectado a Elasticsearch ---")
except Exception as e:
    print(f"--- ❌ Error de conexión: {e} ---")
    exit()
print(f"--- Iniciando simulador (Lotes de {TAMANO_LOTE}) ---")
print(f"Enviando logs a: {INDEX_NAME}")
print("Presiona Ctrl+C para detener.")
print("---------------------------------")

batch_de_logs = []

try:
    with open(CSV_FILE, mode='r', encoding='utf-8', errors='ignore') as file:
        
        csv_reader = csv.DictReader(file)
        
        for row_dict in csv_reader:
            
           
            row_dict["@timestamp"] = datetime.now()

            documento = {
                "_index": INDEX_NAME,
                "_source": row_dict
            }

            batch_de_logs.append(documento)

            if len(batch_de_logs) >= TAMANO_LOTE:
                helpers.bulk(es, batch_de_logs)
                print(f"--- Lote de {len(batch_de_logs)} logs enviado ---")
                batch_de_logs = []
                time.sleep(PAUSA)
    if batch_de_logs:
        helpers.bulk(es, batch_de_logs)
        print(f"--- Lote final de {len(batch_de_logs)} logs enviado ---")

except FileNotFoundError:
    print(f"--- ❌ ERROR: No se encontró el archivo '{CSV_FILE}' ---")
except KeyboardInterrupt:
    print("\n--- Simulador detenido por el usuario ---")
except Exception as e:
    print(f"--- ❌ Error durante la ingesta: {e} ---")
   