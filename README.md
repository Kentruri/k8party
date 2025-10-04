# Kubernetes Pod Scheduling Lab: Taints, Tolerations, and Node Affinity

**Última Actualización:** 4 de Octubre, 2025
**Autor:** Kevin Steven (Cloudnonic)

## 1. Objetivo del Laboratorio

El objetivo de este laboratorio es demostrar técnicas avanzadas de programación de Pods (Pod Scheduling) en Kubernetes. Los participantes deberán construir manifiestos de Pods que se desplieguen exitosamente en nodos de trabajo (`worker nodes`) especializados. Para lograrlo, se deben satisfacer criterios específicos de `namespaces`, `taints`, `tolerations` y `nodeAffinity`.

## 2. Prerrequisitos

Para ejecutar este laboratorio, se requiere el siguiente software:
* Un motor de contenedores (ej. Docker Desktop).
* `k3d` (v5.6.0 o superior).
* `kubectl`.
* `git` y una cuenta de GitHub.

## 3. Arquitectura del Entorno

El laboratorio se ejecuta sobre un clúster local de k3s creado con k3d, compuesto por un nodo de control (`control-plane`) y cuatro nodos de trabajo (`worker nodes`).

Cada nodo de trabajo está especializado para un tipo de carga de trabajo (`workload`) específico. Esta especialización se implementa mediante la asignación de `Labels` y `Taints` únicos a cada nodo, como se detalla a continuación:

### Asignación de Nodos a Cargas de Trabajo

| Carga de Trabajo Designada | Nombre de Host del Nodo Asignado |
| :---                     | :---                            |
| `urbano`                 | `k3d-party-cluster-agent-0`     |
| `metalero`               | `k3d-party-cluster-agent-1`     |
| `electronico`            | `k3d-party-cluster-agent-2`     |
| `latino`                 | `k3d-party-cluster-agent-3`     |

---

## 4. Flujo de Ejecución

El laboratorio se divide en dos roles principales: el **Administrador del Clúster** (configuración del entorno) y el **Participante** (ejecución de la tarea).

### 4.1. Instrucciones para el Administrador del Clúster

El administrador es responsable de provisionar y configurar el clúster según la arquitectura definida.

**Paso 1: Provisionar el Clúster**
Ejecute el siguiente comando para crear el clúster local con k3d:
```bash
k3d cluster create party-cluster --agents 4

**Paso 2: Configurar el Entorno
Este repositorio incluye un script (setup-cluster.sh) que automatiza la creación de namespaces y la aplicación de labels y taints a los nodos.

# Asignar permisos de ejecución (solo la primera vez)
chmod +x setup-cluster.sh

# Ejecutar el script para configurar el clúster
./setup-cluster.sh

