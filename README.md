# prog.movil-Pokedex

## Breve explicación del proyecto
El siguiente proyecto consta de la realizar una Pokedex con sus funciones básicas como escanear y detectar un Pokemon y luego mostrar su información
al igual que en la serie o en los videojuegos. Esta aplicación será desarrollada para dispositivos móviles Android utilizando el framework Flutter.
Para la detección de pokemones se utilizará un modelo de IA ya entrenado para obtener el resultado y en conjunto con PokeAPI para obtener la información
del Pokemon.
<p align="center">
  <img src="https://github.com/NACB654/prog.movil-Pokedex/assets/140445183/76ef19bf-2a11-4597-a233-952bd8373c33" alt="pokedex1" width="300px"/>
  &nbsp &nbsp &nbsp
  <img src="https://github.com/NACB654/prog.movil-Pokedex/assets/140445183/c5f1e765-aa7d-418d-ae56-58d39f48bbfb" alt"pokedex2" width="300px"/>
</p>

## Diagrama de casos de uso (requerimientos funcionales)
<p align="center">
  <img src="https://github.com/NACB654/prog.movil-Pokedex/assets/140445183/5392a4a0-55f5-4aea-b82c-22827cf11c07" alt="casos de uso" width="800px"/>
</p>

## Requerimientos no funcionales
- Disponibilidad de la Aplicación: Asegurar que la aplicación esté operativa con un tiempo de inactividad mínimo para mantener la confianza del usuario y la integridad del servicio.
- Seguridad de la API: Implementar medidas robustas de seguridad en la API de Flask para proteger la aplicación contra ataques y garantizar la privacidad de los datos.
- Desempeño y Carga: Garantizar que la aplicación mantenga un rendimiento óptimo incluso bajo cargas de usuario altas y durante picos de tráfico.
- Compatibilidad: La aplicación debe funcionar de manera consistente en varios dispositivos Android, asegurando una experiencia de usuario uniforme.
- Escalabilidad de la Base de Datos*: La base de datos debe ser capaz de manejar el crecimiento del volumen de datos y del número de transacciones sin degradar el rendimiento.
- Respaldo y Recuperación: Mantener una estrategia efectiva de respaldo y recuperación de datos para la base de datos en Azure, previniendo la pérdida de datos críticos.
- Mantenibilidad: Facilitar el mantenimiento del sistema con código bien documentado y estructurado, permitiendo actualizaciones y mejoras con eficiencia.
 
## Diagrama de base de datos
<p align="center">
  <img src="https://github.com/NACB654/prog.movil-Pokedex/assets/118631042/7956118c-98c9-44ce-95d9-e076a68b0204" alt="casos de uso" width="800px"/>
</p>


## Diagrama de despliegue
El presente diagrama de despliegue muestra los diferentes componentes del app. Primero se tiene el dispositivo o entorno que consiste en el celular Android a ser utilizado, el cual contiene el componente de aplicativo basado en Flutter.  Este tendra una relacion directa con el backend seleccionado, el cual consiste en un aplicativo mediante Flask que contiene componentes como el flask API y el modelo de AI entrenado (o el transformador), el cual permitira el funcionamiento del Pokedex.Este recibe informacion del nodo Base de Datos. La cual tendra los servicios de Microsoft Azure y la base de datos basada en PostgreSQL como componentes.
<p align="center">
  <img src="https://github.com/NACB654/prog.movil-Pokedex/assets/118631042/94891d2e-8a3a-4b9e-8bbd-155aa4c7c566" alt="despliegue"/>
</p>


## Prototipo del proyecto
[Figma-Pokedex]

[Figma-Pokedex]: https://www.figma.com/file/2gCQSVnbD8AxOpzM4kIJ56/Pokedex?type=design&mode=design&t=MGWz17h9MrwZGsDE-1
