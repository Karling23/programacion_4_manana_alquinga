# Plan de Implementación: Aplicación de Control Emocional y Bienestar Mental

Este plan de desarrollo detalla cómo duplicar, renombrar y adaptar los mini-proyectos de Flutter al tema de **Control Emocional**. Todos los archivos copiados en la carpeta `lib/` de cada módulo usarán el sufijo `_mp.dart` antes de la extensión (ej. `nombre_archivo_mp.dart`), mientras que los archivos `main.dart` se mantendrán con su nombre original pero modificando su estructura e imports internamente.

---

## Módulos a Desarrollar

### 1. Módulo 6: Widgets (`modulo06_widgets`)
En este módulo se crearán los componentes de interfaz básicos adaptados para el autoconocimiento y la regulación emocional.

* **Estructura y Archivos a Copiar/Adaptar:**
  * `lib/widgets/catalogo_basicos_mp.dart` (Catálogo de técnicas de calma)
    * *Adaptación:* Muestra un catálogo visual de técnicas de regulación (ej. Respiración diafragmática, Meditación guiada, Escritura reflexiva). Cada tarjeta detallará el nivel de estrés recomendado para su uso, descripción, y un botón de "Iniciar Ejercicio".
  * `lib/widgets/contador_limitado_mp.dart` (Contador de momentos de calma diarios)
    * *Adaptación:* Un contador para registrar las sesiones de respiración o meditación completadas en el día, con una barra de progreso que refleje el cumplimiento de la meta diaria (ej. Meta: 5 sesiones al día).
  * `lib/widgets/etiqueta_mp.dart` (Etiquetas de estados emocionales)
    * *Adaptación:* Chips de color condicionales para categorizar el estado de ánimo actual (ej. Verde para "Calma", Azul para "Tristeza", Naranja para "Ansiedad", Rojo para "Ira").
  * `lib/widgets/reloj_mp.dart` (Temporizador de respiración guiada)
    * *Adaptación:* Un cronómetro de cuenta regresiva configurado para técnicas de relajación (ej. Ciclos de inhalación y exhalación de 4 segundos).
  * `lib/widgets/servicio_estado_mp.dart` (Monitoreo de estado de alerta emocional)
    * *Adaptación:* Representa el estado de alerta del usuario (ej. "En calma" con icono verde/corazón vs "Alerta de Ansiedad" con icono naranja/advertencia), permitiendo activar un "Protocolo de Emergencia de Respiración" o reiniciar el estado de alerta.
  * `lib/widgets/pantalla_contexto_mp.dart` (Dashboard adaptativo de bienestar)
    * *Adaptación:* Muestra recomendaciones personalizadas de relajación basadas en la orientación de la pantalla (ej. modo lectura amplia para reflexiones en tableta) y la configuración visual del sistema.
* **Modificación en `lib/main.dart`:**
  * Actualizar imports hacia las versiones `_mp.dart` y configurar el enrutador de pasos con temas y colores suaves (azules, lavandas o verdes menta) idóneos para la relajación.

---

### 2. Módulo 9: Formularios (`modulo09_formularios`)
Este módulo servirá para crear un registro formal o "Diario Emocional" mediante entradas estructuradas.

* **Estructura y Archivos a Copiar/Adaptar:**
  * `lib/models/servidor_ssh_mp.dart` (Modelo de datos emocionales)
    * *Adaptación:* Cambiar a modelos `RegistroEmocional` (id, emoción, intensidad 1-10, desencadenante, pensamientos, síntomas físicos, técnica aplicada) y `ConsejoBienestar`.
  * `lib/widgets/formulario_servidor_mp.dart` (Formulario de Diario Emocional)
    * *Adaptación:* Formulario completo de autoevaluación:
      * Campo de texto: Pensamiento recurrente o situación.
      * Campo numérico: Nivel de intensidad del sentimiento (1 al 10).
      * Desplegable: Tipo de emoción primaria (Ansiedad, Tristeza, Enojo, Alegría).
      * Desplegable: Desencadenante (Trabajo, Familia, Social, Salud).
      * SwitchListTile: ¿Lograste aplicar una técnica de regulación?
  * `lib/widgets/fila_servidor_mp.dart` y `tarjeta_servidor_grid_mp.dart` (Tarjetas de historial)
    * *Adaptación:* Tarjetas visuales que muestran un resumen rápido del registro del día, cambiando de color según el nivel de intensidad emocional registrado.
  * `lib/screens/pantalla_servidores_mp.dart` y `pantalla_busqueda_mp.dart` (Historial y buscador)
    * *Adaptación:* Pantallas para buscar y filtrar registros anteriores del diario según la emoción o la categoría del desencadenante.
* **Modificación en `lib/main.dart`:**
  * Enlazar el flujo de pasos para desplegar el historial de registros y el formulario de autoevaluación emocional.

---

### 3. Módulo 10: Riverpod (`modulo10_riverpod`)
Se implementará la gestión del estado global de la aplicación (el historial y estadísticas del diario de emociones) utilizando Riverpod.

* **Estructura y Archivos a Copiar/Adaptar:**
  * `lib/models/metrica_servidor_mp.dart` (Métricas de salud mental)
    * *Adaptación:* Modelo para almacenar estadísticas diarias del usuario (horas de sueño, nivel de estrés, cantidad de crisis y técnica más usada).
  * `lib/providers/servidores_provider_mp.dart` (Proveedor del diario emocional)
    * *Adaptación:* `StateNotifier` para agregar, eliminar y marcar favoritos en el Diario Emocional, y un provider derivado para filtrar las emociones intensas que requieren atención.
  * `lib/providers/metricas_provider_mp.dart` (Carga asíncrona de estadísticas)
    * *Adaptación:* Simula la carga asíncrona desde una base de datos local del historial de métricas semanales de bienestar.
  * `lib/screens/pantalla_metricas_mp.dart` (Gráficos de bienestar)
    * *Adaptación:* Muestra barras de progreso de hábitos saludables (Nivel de calma, Calidad del sueño, Ejercicio mental completado).
  * `lib/screens/pantalla_dashboard_mp.dart` (Navegación general por tabs)
    * *Adaptación:* Dashboard con tabs reactivas manejadas por Riverpod para alternar entre la lista del Diario y las estadísticas.
* **Modificación en `lib/main.dart`:**
  * Configurar el `ProviderScope` global y cargar la pantalla dashboard de bienestar mental.

---

### 4. Módulo 11: GoRouter (`modulo11_gorouter`)
Este módulo se encargará del enrutamiento seguro de la aplicación, incluyendo flujos de inicio, detalles de autoevaluación, y restricción de acceso con inicio de sesión.

* **Estructura y Archivos a Copiar/Adaptar:**
  * `lib/router/app_router_mp.dart` (Enrutador de bienestar)
    * *Adaptación:* Configura las rutas navegables:
      * `/` -> Pantalla de Inicio / Bienvenida de bienestar.
      * `/diario` -> Historial de autoevaluaciones.
      * `/diario/:id` -> Vista detallada del registro (donde el usuario puede leer reflexiones que escribió en esa fecha específica).
      * `/login` -> Acceso seguro (para proteger la privacidad de los datos personales de salud mental).
  * `lib/providers/auth_provider_mp.dart` (Control de sesión de usuario)
    * *Adaptación:* Controla si el usuario está autenticado para acceder a sus notas privadas del diario emocional.
  * `lib/screens/pantalla_detalle_mp.dart` (Ficha de análisis del registro)
    * *Adaptación:* Muestra un desglose completo de un día específico: pensamientos automáticos detectados, distorsiones cognitivas comunes identificadas y reflexiones posteriores.
* **Modificación en `lib/main.dart`:**
  * Inicializar el enrutador GoRouter con las pantallas y guards de privacidad emocional.

---

### 5. Módulo 12: API (`modulo12_api`)
Integración con un servicio REST externo para obtener frases de motivación diarias o consejos terapéuticos prácticos de relajación.

* **Estructura y Archivos a Copiar/Adaptar:**
  * `lib/producto_mp.dart` y `producto_dto_mp.dart` (DTO y modelo de frase)
    * *Adaptación:* Modelos y DTOs para mapear e interpretar JSON de APIs externas de citas y mindfulness (ej. ZenQuotes API o similares).
  * `lib/pantalla_paso1_mp.dart` a `pantalla_paso3_mp.dart` (Consumo y renderizado de frases)
    * *Adaptación:* Conexión y renderizado usando `FutureBuilder` para traer de forma asíncrona la "Frase del Día" de relajación y consejos prácticos de psicólogos/terapeutas.
* **Modificación en `lib/main.dart`:**
  * Menú de pasos que permite probar el consumo de consejos rápidos, listado de terapeutas y DTOs de regulación emocional.

---

## Criterios de Éxito en la Entrega
1. **Compilación Limpia:** No debe haber errores de análisis de Dart tras renombrar imports.
2. **Independencia:** Los archivos originales deben seguir intactos y funcionando en su respectivo flujo original.
3. **Coherencia Visual:** La paleta de colores de la aplicación debe ajustarse a tonalidades pastel y relajantes (tonos verde menta, lavanda o azul cielo), coherente con el control emocional.
