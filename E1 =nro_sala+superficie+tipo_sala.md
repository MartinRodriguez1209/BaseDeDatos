E1 =nro\_sala+superficie+tipo\_sala

E2 =codigo\_aparato+descripción\_ap+estado+nro\_sala+tipo\_sala

E3 =codigo\_clase+descripción\_clase+día\_hora+dni\_profesor+ nombre\_prof + {nro\_socio+ nombre\_socio + profesión}

E4 =dni\_profesor+nombre\_prof+título+experiencia\_prof+fecha\_ingreso

E5=nro\_socio+ nombre\_socio+dirección+teléfono+{codigo\_aparato}



Primera forma normal: 



E1.1 =nro\_sala+superficie+tipo\_sala



E2.1 =codigo\_aparato+descripción\_ap+estado+nro\_sala+tipo\_sala



E3.1 =codigo\_clase+descripción\_clase+día\_hora+dni\_profesor+ nombre\_prof 

E3.2 =**codigo\_clase**+  **nro\_socio**+ nombre\_socio + profesión 



E4.1 =dni\_profesor+nombre\_prof+título+experiencia\_prof+fecha\_ingreso



E5.1=nro\_socio+ nombre\_socio + dirección + teléfono

E5.2= codigo\_aparato + nro\_socio



Segunda forma normal:



E1.1.1 = nro\_sala+superficie+tipo\_sala



E2.1.1 = codigo\_aparato+descripción\_ap+estado+nro\_sala+tipo\_sala



E3.1.1 = codigo\_clase+descripción\_clase+día\_hora+dni\_profesor+ nombre\_prof

E3.2.1 = **codigo\_clase**+  **nro\_socio**

E3.2.2 = **nro\_socio**+ nombre\_socio + profesión



E4.1.1 = dni\_profesor+nombre\_prof+título+experiencia\_prof+fecha\_ingreso



E5.1.1 = nro\_socio+ nombre\_socio + dirección + teléfono

E5.2.1 = codigo\_aparato + nro\_socio



Tercera forma normal:



E1.1.1.1 = **nro\_sala** + superficie + tipo\_sala



E2.1.1.1 = **codigo\_aparato** + descripción\_ap + estado + nro\_sala 

E2.1.1.2 = **nro\_sala** + tipo\_sala



E3.1.1.1 = **codigo\_clase** + descripción\_clase + día\_hora + *dni\_profesor (FK)*

E3.1.1.2 = **dni\_profesor** + nombre\_prof



E3.2.1.1 = **codigo\_clase**+  **nro\_socio**

E3.2.2.2 = **nro\_socio**+ nombre\_socio + profesión



E4.1.1.1 = **dni\_profesor** + nombre\_prof + título + experiencia\_prof + fecha\_ingreso



E5.1.1.1 = nro\_socio+ nombre\_socio + dirección + teléfono



E5.2.1.1 = codigo\_aparato + nro\_socio



Renombramiento:





APARATO = **codigo\_aparato** + descripción\_ap + estado + nro\_sala

SALA = **nro\_sala** + tipo\_sala + superficie



CLASE = **codigo\_clase** + descripción\_clase + día\_hora + *dni\_profesor (FK)*

PROFESOR = **dni\_profesor** + nombre\_prof



CLASE\_SOCIO = **codigo\_clase**+  **nro\_socio**



PROFESOR = **dni\_profesor** + nombre\_prof + título + experiencia\_prof + fecha\_ingreso



SOCIO = **nro\_socio**+ nombre\_socio + dirección + teléfono + profesión



APARATO\_SOCIO = **codigo\_aparato** + **nro\_socio**





**Esquema = numero\_proyecto + descripción + fecha\_inicio +**

**fecha\_estipulada\_fin + {dni\_empleado + nombre + numero\_legajo +**

**{numero\_familiar + nombre\_familiar } + {id\_maquina + descripción +**

**tipo\_maquina + fecha\_asignacion } + {numero\_telefono + tipo\_telefono}} +**

**numero\_cliente + nombre\_cliente + dni\_cliente + fecha\_nacimiento**



**Primera forma normal**



E1 = **numero\_proyecto** + descripcion + fecha\_inicio + fecha\_estipulada\_fin + numero\_cliente 

\+ nombre\_cliente + dni\_cliente + fecha\_nacimiento

E2 = **dni\_empleado + numero\_proyecto +** nombre + numero\_legajo 

E3 = **numero\_familiar + dni\_empleado + numero\_proyecto +** nombre\_familiar

E4 = **id\_maquina** **+ dni\_empleado + numero\_proyecto** + descripcion\_maquina 

\+ tipo\_maquina + fecha\_asignacion

E5 = **numero\_telefono** + **dni\_empleado + numero\_proyecto** + tipo\_telefono



**Segunda forma normal**



E1.1 = **numero\_proyecto** + descripcion + fecha\_inicio + fecha\_estipulada\_fin + numero\_cliente

\+ nombre\_cliente + dni\_cliente + fecha\_nacimiento



E2.1 = **dni\_empleado + numero\_proyecto** 

E2.2 = **numero\_proyecto +** nombre + numero\_legajo



E3.1 = **numero\_familiar + dni\_empleado + numero\_proyecto** 

E3.2 = **numero\_familiar +** nombre\_familiar



E4.1 = **id\_maquina** **+ dni\_empleado + numero\_proyecto** + fecha\_asignacion

E4.2 = **id\_maquina** + descripcion\_maquina + tipo\_maquina



E5.1 = **numero\_telefono** + **dni\_empleado + numero\_proyecto** 

E5.2 = **numero\_telefono** + tipo\_telefono



**Tercera forma normal**



E1.1.1 = **numero\_proyecto** + descripcion + fecha\_inicio + fecha\_estipulada\_fin + numero\_cliente(FK)

E1.1.2 = **numero\_cliente** + nombre\_cliente + dni\_cliente + fecha\_nacimiento 



E2.1.1 = **dni\_empleado + numero\_proyecto**

E2.2.1 = **dni\_empleado +** nombre + numero\_legajo



E3.1.1 = **numero\_familiar + dni\_empleado + numero\_proyecto**

E3.2.1 = **numero\_familiar +** nombre\_familiar

&nbsp;

E4.1.1 = **id\_maquina** **+ dni\_empleado + numero\_proyecto** + fecha\_asignacion

E4.2.1 = **id\_maquina** + descripcion\_maquina + tipo\_maquina



E5.1.1 = **numero\_telefono** + **dni\_empleado + numero\_proyecto**

E5.2.1 = **numero\_telefono** + tipo\_telefono



Renombramiento



PROYECTO = **numero\_proyecto** + descripcion + fecha\_inicio + fecha\_estipulada\_fin + numero\_cliente(FK)

CLIENTE = **numero\_cliente** + nombre\_cliente + dni\_cliente + fecha\_nacimiento



EMPLEADO\_PROYECTO = **dni\_empleado + numero\_proyecto**

EMPLEADO = **dni\_empleado +** nombre + numero\_legajo



FAMILIAR\_EMPLEADO\_PROYECTO = **numero\_familiar + dni\_empleado + numero\_proyecto**

FAMILIAR = **numero\_familiar +** nombre\_familiar

 

MAQUINA\_EMPLEADO\_PROYECTO = **id\_maquina** **+ dni\_empleado + numero\_proyecto** + fecha\_asignacion

MAQUINA = **id\_maquina** + descripcion\_maquina + tipo\_maquina



TELEFONO\_EMPLEADO\_PROYECTO = **numero\_telefono** + **dni\_empleado + numero\_proyecto**

TELEFONO = **numero\_telefono** + tipo\_telefono















