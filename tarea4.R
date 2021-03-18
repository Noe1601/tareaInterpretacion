install.packages("readr")
library(readr)

#Ruta de mi dataset
ruta_csv <- "https://promipyme.gob.do/images/contenidos/convenios/NominaDeEmpleadosFijosPROMIPYME_2019-2020_3.csv"

#Leyendo mi dataset (csv)
datos <- read.csv(ruta_csv) # Primera visualizacion de los datos


#Segunda visualizacion de tablas (Agregandole columnas
# con datos a partir del dataset original)

attach(datos)
datos$SueldoANual <- SALARIO * 12

segunda_visualizacion <- datos


# Tercera visualizacion (Agregandole columnas
# con datos a partir del dataset original)

attach(datos)
datos$sueldoQuincenal <- SALARIO / 2
datos$descuentoAFP <- SALARIO * 0.0287
datos$descuentoSeguro <- SALARIO * 0.0304

tercera_visualizacion <- datos

#-------------------------------------------------

# GRAFICOS

# Primer grafico

install.packages("ggplot2")
library(ggplot2)

ggplot(data = datos,
       mapping = aes(x = SALARIO,
                     )) +
       geom_histogram( bins = 9,
                       position = 'identity',
                       alpha = 0.9) +
       labs(title = 'Grafico de salario',
            fill = 'Salarios',
            x = 'Cantidades monetarias',
            y = 'Cantidad empleados',
            subtitle = 'Nomina de empleados',
            caption = 'fuente de los datos: Datos abierto RD')


# Segundo grafico

ggplot(data = datos,
       mapping = aes(x = AÑO,
                     y = sueldoQuincenal,
                     color='gray')) + geom_point() 

# Tercer grafico

ggplot(data = datos[datos$descuentoAFP > 8000,],
       mapping = aes(x = AÑO,
                     y = descuentoAFP)) + geom_line()

# Cuarto grafico

ggplot( data = datos[datos$descuentoSeguro > 3000,],
        mapping = aes(x = AÑO,
                      y = descuentoSeguro)) + geom_boxplot() +
                      geom_jitter()

# Quinto grafico

ggplot( data = datos,
        mapping = aes(x = AÑO,
                      y = SueldoANual)) + geom_col()

                      