## 🧠 README.md - Laboratorios de Redes en Azure

### 🎯 Objetivo General
Que los estudiantes comprendan y practiquen distintos escenarios de redes en Azure usando scripts de bajo costo, seguros y automatizados, validando las configuraciones desde el portal y por CLI.

---

## ✅ Escenarios Incluidos

### 1. VNet + Subnet Básica
- Crea una red virtual con una subred.
- Útil para aprender estructura básica de redes.

### 2. VNet Peering entre dos VNets
- Comunicación entre dos redes virtuales en la misma región.
- Aplicación: compartición de servicios internos.

---

## 🧰 Scripts Incluidos

### 🔹 `crear_lab_redes.sh`
- Crea todo el laboratorio con etiquetas, NSGs, subredes, VMs básicas.

### 🔹 `verificar_lab_redes.sh`
- Verifica que la infraestructura se haya creado correctamente.
- Muestra IPs públicas y privadas.
- Sugerencia de pruebas desde el portal y CLI.

### 🔹 `eliminar_lab_redes.sh`
- Elimina todo lo creado.
- Incluye confirmación y espera a que termine la destrucción de recursos.

---

## 💡 Recomendaciones

- Ejecutar desde Azure Cloud Shell o desde tu máquina local con Azure CLI instalado.
- Siempre correr `az login` primero.
- Asegúrate de usar una suscripción gratuita o de estudiantes para evitar costos.
- Todas las VMs usan tipo B1s (bajo costo) y tiempo de vida corto.

---

## 📂 Estructura del Repositorio

```bash
Azure-Network-Labs/
├── crear_lab_redes.sh
├── verificar_lab_redes.sh
├── eliminar_lab_redes.sh
└── README.md
```

---

¿Listo para desplegar tu primer laboratorio? 😎
Corre:
```bash
chmod +x crear_lab_redes.sh
./crear_lab_redes.sh
```

---

## ✨ Autor
Jose Garagorry - Instrucción en Administración de Redes Azure y Ambientes Híbridos
