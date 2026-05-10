# TEAM FORTRESS - Flores y Detalles Alesli

## Informacion del Proyecto

| Campo | Detalle |
|-------|---------|
| Proyecto | Sistema Web para la Gestion de Pedidos e Inventario |
| Empresa | Flores y Detalles Alesli |
| Ubicacion | La Paz, Bolivia |
| Metodologia | Scrum |

## Integrantes

| Nombre | Rol |
|--------|-----|
| Andres Fernando Flores Moya | Backend Developer |
| Brayan Hairton Maron Huanca | Frontend Developer |
| Julio Cesar Chipana Oxa | Database Manager |
| Stalim Gutler Chacon Gomez | Scrum Master |

## Stack Tecnologico

Lenguajes: Python, PHP, JavaScript, HTML5, CSS3

Frameworks: Bootstrap

Herramientas: Git, GitHub, Visual Studio Code

Base de datos: MySQL

Arquitectura: Cliente-Servidor, Full Stack

## Estructura de Ramas

```
main
develop
feature/andres
feature/brayan
feature/julio
feature/stalim
```

Flujo de trabajo:
1. Cada integrante trabaja en su rama feature/nombre
2. Hace Pull Request hacia develop
3. El equipo revisa y aprueba
4. Cuando develop esta estable, se hace merge a main

## Estructura del Proyecto

```
team-fortress-alesli/
├── backend/
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   └── config/
├── frontend/
│   ├── pages/
│   ├── components/
│   └── assets/
│       ├── css/
│       ├── js/
│       └── images/
├── database/
│   ├── migrations/
│   ├── seeds/
│   └── backups/
├── docs/
│   ├── sprints/
│   └── diagramas/
├── assets/
│   ├── logos/
│   └── mockups/
├── README.md
├── .gitignore
└── LICENSE
```

## Objetivo General

Desarrollar un sistema web para la gestion de pedidos e inventario mediante tecnologia web para la floreria Alesli en la ciudad de La Paz, Bolivia.

## Modulos del sistema

- Inventario
- Pedidos
- Clientes
- Reportes
- Roles y Seguridad

## Colaboradores docentes

- lpze.ignaciorussel.zarate.ja@unifranz.edu.bo
- lpze.vicenteoscar.claros.ma@unifranz.edu.bo
- lpze.victorgrover.asturizaga.pl@unifranz.edu.bo
- lpze.nilsbenjamin.pune.ma@unifranz.edu.bo

## Comandos rapidos

```bash
git clone https://github.com/TU_USUARIO/team-fortress-alesli.git
cd team-fortress-alesli

git checkout feature/andres
git checkout feature/brayan
git checkout feature/julio
git checkout feature/stalim

git add .
git commit -m "descripcion del cambio"
git push origin feature/tu-nombre
```
