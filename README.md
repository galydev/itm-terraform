# Proyecto de Infraestructura con Terraform

## Descripción

Este proyecto contiene la infraestructura como código (IaC) utilizando Terraform para gestionar recursos en la nube de manera automatizada, versionada y reproducible.

## Requisitos Previos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- Credenciales configuradas para el proveedor de nube utilizado (AWS, Azure, GCP, etc.)
- Git para control de versiones

## Estructura del Proyecto

```
terraform/
├── main.tf              # Configuración principal de recursos
├── variables.tf         # Definición de variables
├── outputs.tf          # Valores de salida
├── providers.tf        # Configuración de proveedores
├── terraform.tfvars    # Valores de variables (no versionar si contiene secretos)
└── README.md           # Este archivo
```

## Configuración Inicial

### 1. Inicializar el Proyecto

Descarga los proveedores y módulos necesarios:

```bash
terraform init
```

### 2. Reconfigurar Proyecto (si es necesario)

Si necesitas cambiar el backend o reinicializar:

```bash
terraform init --reconfigure
```

## Uso

### Visualizar Plan de Ejecución

Revisa los cambios que se aplicarán antes de ejecutarlos:

```bash
terraform plan
```

Para guardar el plan en un archivo:

```bash
terraform plan -out=tfplan
```

### Aplicar Cambios

Aplica los cambios en la infraestructura:

```bash
terraform apply
```

Con aprobación automática (usar con precaución):

```bash
terraform apply --auto-approve
```

Aplicar un plan guardado:

```bash
terraform apply tfplan
```

### Destruir Recursos

Elimina todos los recursos gestionados por Terraform:

```bash
terraform destroy
```

Con aprobación automática:

```bash
terraform destroy --auto-approve
```

## Workspaces (Entornos)

Los workspaces permiten gestionar múltiples entornos (dev, staging, prod) con la misma configuración.

### Listar Workspaces

```bash
terraform workspace list
```

### Crear Nuevo Workspace

```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```

### Cambiar de Workspace

```bash
terraform workspace select dev
```

### Ver Workspace Actual

```bash
terraform workspace show
```

## Comandos Útiles

### Formatear Código

Formatea automáticamente los archivos `.tf`:

```bash
terraform fmt
```

### Validar Configuración

Verifica que la sintaxis y configuración sean correctas:

```bash
terraform validate
```

### Mostrar Estado Actual

```bash
terraform show
```

### Listar Recursos

```bash
terraform state list
```

### Ver Detalles de un Recurso

```bash
terraform state show <nombre_recurso>
```

### Importar Recursos Existentes

```bash
terraform import <tipo_recurso>.<nombre> <id_recurso>
```

### Actualizar Estado

```bash
terraform refresh
```

## Variables de Entorno

Puedes configurar variables mediante archivos `.tfvars` o variables de entorno:

```bash
export TF_VAR_nombre_variable="valor"
```

## Mejores Prácticas

1. **No versionar secretos**: Usa `.gitignore` para archivos como `terraform.tfvars` que contengan información sensible
2. **Backend remoto**: Configura un backend remoto (S3, Azure Blob, etc.) para compartir el estado entre equipos
3. **Bloqueo de estado**: Habilita el bloqueo de estado para evitar conflictos en equipos
4. **Módulos**: Organiza código reutilizable en módulos
5. **Validación**: Ejecuta `terraform validate` y `terraform plan` antes de aplicar cambios
6. **Versionado**: Especifica versiones de proveedores para evitar cambios inesperados
7. **Workspaces**: Usa workspaces para gestionar diferentes entornos

## Solución de Problemas

### Error de Estado Bloqueado

Si el estado queda bloqueado:

```bash
terraform force-unlock <LOCK_ID>
```

### Recrear Estado

Si el estado se corrompe (usar con extrema precaución):

```bash
terraform state rm <recurso>
terraform import <recurso> <id>
```

## Recursos Adicionales

- [Documentación oficial de Terraform](https://www.terraform.io/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Best Practices](https://www.terraform-best-practices.com/)

## Contribución

1. Crea una rama para tu feature: `git checkout -b feature/nueva-funcionalidad`
2. Realiza tus cambios y valida: `terraform validate && terraform fmt`
3. Commit de cambios: `git commit -am 'Descripción del cambio'`
4. Push a la rama: `git push origin feature/nueva-funcionalidad`
5. Crea un Pull Request