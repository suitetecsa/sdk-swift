let loginResponse = """
    {
        "resp": {
            "token": "eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiIrNTM1NTYyNzU3OSIsImlhdCI6MTY5MDMyOTAwNCwiaXNzIjoiZ2VzTmF1dGFTZXJ2aWNlcyIsImV4cCI6MTY5MDMzMjYwNCwidXNlcl9pbmZvIjoie1wibGxwZGNcIjpcIjFlYTFjMzIzLWEyMzMtNGE1Zi1hNmIwLTU3NTk3ZWI3MTFlYlwiLFwiaWRlbnRpZmljYWNpb25cIjpcIjk4MTIxNjAyNDA2XCIsXCJ0aXBvSWRlbnRpZmljYWNpb25cIjpcIjFcIixcInBlcnNvbmFfaWRcIjpcIjFlYTFjMzIzLWEyMzMtNGE1Zi1hNmIwLTU3NTk3ZWI3MTFlYlwiLFwidXN1YXJpb19wb3J0YWxcIjpcIis1MzU1NjI3NTc5XCIsXCJub21icmVcIjpcInBlZHJvIG9tYXIgY2FzYWJlbGxhIGxlbXVzXCIsXCJjb3JyZW9cIjpcInBvY2w5ODEyQGdtYWlsLmNvbVwiLFwidGVsZWZvbm9cIjpcIjU1NjI3NTc5XCJ9In0.YjkZdhXHEyuH2CmCMMEmvDSFE8sh3HyhK55_4dD3UJwRj8g5sFLbE7_ktrpasS8k",
            "user": {
                "cliente": {
                    "nombre": "pedro omar casabella lemus",
                    "telefono": "55627579",
                    "email": "pocl9812@gmail.com",
                    "notificaciones_mail": "false",
                    "notificaciones_movil": "true",
                    "usuario_portal": "+5355627579",
                    "operaciones": {
                        "Pagos electrónicos en el portal": {
                            "operacion": "Pagos electrónicos en el portal",
                            "url": "queryPagosOnLine",
                            "tipo": "CONSULTA",
                            "comercioElectronico": "false",
                            "metodo": "GET",
                            "modo": "ASINCRONICO",
                            "id": "query_pago_operaciones",
                            "alteraPerfilServicio": "NO",
                            "parametros": {
                                "Cliente Id": {
                                    "nombre": "Cliente Id",
                                    "parametro": "clienteId",
                                    "valor": "1ea1c323-a233-4a5f-a6b0-57597eb711eb",
                                    "tipo": "STRING",
                                    "orden": "1"
                                },
                                "Fecha": {
                                    "nombre": "Fecha",
                                    "parametro": "fecha",
                                    "valor": "",
                                    "tipo": "DATETIME",
                                    "orden": "2"
                                },
                                "pagina": {
                                    "nombre": "pagina",
                                    "parametro": "pagina",
                                    "valor": "0",
                                    "tipo": "NUMERIC",
                                    "orden": "3"
                                },
                                "Elementos por páginas": {
                                    "nombre": "Elementos por páginas",
                                    "parametro": "itemsPorPagina",
                                    "valor": "0",
                                    "tipo": "NUMERIC",
                                    "orden": "4"
                                }
                            }
                        },
                        "Crear cuenta de navegación (@nauta.com.cu)": {
                            "operacion": "Crear cuenta de navegación (@nauta.com.cu)",
                            "url": "crearCuentaAcceso",
                            "tipo": "ALTA",
                            "comercioElectronico": "false",
                            "metodo": "POST",
                            "modo": "ASINCRONICO",
                            "id": "create_cta_permanente",
                            "alteraPerfilServicio": "NO",
                            "parametros": {
                                "Tipo de servicio": {
                                    "nombre": "Tipo de servicio",
                                    "parametro": "especificacionProductoId",
                                    "valor": "100",
                                    "tipo": "STRING",
                                    "orden": "4"
                                },
                                "Cuenta de navegación": {
                                    "nombre": "Cuenta de navegación",
                                    "parametro": "cuenta",
                                    "valor": "",
                                    "tipo": "STRING",
                                    "orden": "1"
                                },
                                "Contraseña": {
                                    "nombre": "Contraseña",
                                    "parametro": "password",
                                    "valor": "",
                                    "tipo": "NEWPASSWORD",
                                    "orden": "2"
                                },
                                "Cliente": {
                                    "nombre": "Cliente",
                                    "parametro": "clienteId",
                                    "valor": "1ea1c323-a233-4a5f-a6b0-57597eb711eb",
                                    "tipo": "STRING",
                                    "orden": "3"
                                }
                            }
                        },
                        "Crear cuenta de correo (@nauta.cu)": {
                            "operacion": "Crear cuenta de correo (@nauta.cu)",
                            "url": "crearCuentaCorreo",
                            "tipo": "ALTA",
                            "comercioElectronico": "false",
                            "metodo": "POST",
                            "modo": "ASINCRONICO",
                            "id": "create_email",
                            "alteraPerfilServicio": "NO",
                            "parametros": {
                                "Tipo de servicio": {
                                    "nombre": "Tipo de servicio",
                                    "parametro": "especificacionProductoId",
                                    "valor": "correo",
                                    "tipo": "STRING",
                                    "orden": "4"
                                },
                                "Cuenta de correo": {
                                    "nombre": "Cuenta de correo",
                                    "parametro": "cuenta",
                                    "valor": "",
                                    "tipo": "STRING",
                                    "orden": "1"
                                },
                                "Contraseña": {
                                    "nombre": "Contraseña",
                                    "parametro": "password",
                                    "valor": "",
                                    "tipo": "NEWPASSWORD",
                                    "orden": "2"
                                },
                                "Cliente": {
                                    "nombre": "Cliente",
                                    "parametro": "clienteId",
                                    "valor": "1ea1c323-a233-4a5f-a6b0-57597eb711eb",
                                    "tipo": "STRING",
                                    "orden": "3"
                                }
                            }
                        },
                        "Operaciones realizadas en el portal": {
                            "operacion": "Operaciones realizadas en el portal",
                            "url": "queryOperations",
                            "tipo": "CONSULTA",
                            "comercioElectronico": "false",
                            "metodo": "GET",
                            "modo": "ASINCRONICO",
                            "id": "query_operations",
                            "alteraPerfilServicio": "NO",
                            "parametros": {
                                "Cliente Id": {
                                    "nombre": "Cliente Id",
                                    "parametro": "clienteId",
                                    "valor": "1ea1c323-a233-4a5f-a6b0-57597eb711eb",
                                    "tipo": "STRING",
                                    "orden": "1"
                                },
                                "Fecha": {
                                    "nombre": "Fecha",
                                    "parametro": "fecha",
                                    "valor": "",
                                    "tipo": "DATETIME",
                                    "orden": "2"
                                },
                                "pagina": {
                                    "nombre": "pagina",
                                    "parametro": "pagina",
                                    "valor": "0",
                                    "tipo": "NUMERIC",
                                    "orden": "3"
                                },
                                "Elementos por páginas": {
                                    "nombre": "Elementos por páginas",
                                    "parametro": "itemsPorPagina",
                                    "valor": "0",
                                    "tipo": "NUMERIC",
                                    "orden": "4"
                                }
                            }
                        }
                    }
                },
                "Servicios": {
                    "Navegación": {
                        "pedroomar.casabella@nauta.com.cu": {
                            "perfil": {
                                "Cuenta de acceso": "pedroomar.casabella@nauta.com.cu",
                                "Fecha de venta": "20-03-2017",
                                "Estado": "HABILITADO",
                                "Fecha de bloqueo": "30-11-2037",
                                "Fecha de eliminación": "31-12-2037",
                                "Tipo de acceso": "NAUTA_INTERNACIONAL_RECARGABLE",
                                "Horas de bonificación": "0",
                                "Bonificación por disfrutar": "00:00:00",
                                "Moneda": "CUP",
                                "id": "17011138248",
                                "saldo": "2.27"
                            },
                            "tipoProducto": "NAVEGACION",
                            "operaciones": {
                                "Cambiar contraseña": {
                                    "operacion": "Cambiar contraseña",
                                    "url": "changeAccessPassword",
                                    "tipo": "MODIFICACION",
                                    "comercioElectronico": "false",
                                    "metodo": "POST",
                                    "modo": "ASINCRONICO",
                                    "id": "change_passw_cuenta_permanente",
                                    "alteraPerfilServicio": "NO",
                                    "parametros": {
                                        "Cuenta de acceso": {
                                            "nombre": "Cuenta de acceso",
                                            "parametro": "cuenta",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Contraseña anterior": {
                                            "nombre": "Contraseña anterior",
                                            "parametro": "oldPassword",
                                            "valor": "",
                                            "tipo": "PASSWORD",
                                            "orden": "2"
                                        },
                                        "Contraseña nueva": {
                                            "nombre": "Contraseña nueva",
                                            "parametro": "newPassword",
                                            "valor": "",
                                            "tipo": "NEWPASSWORD",
                                            "orden": "3"
                                        }
                                    }
                                },
                                "Desconectar sesión de navegación": {
                                    "operacion": "Desconectar sesión de navegación",
                                    "url": "desconectarServicio",
                                    "tipo": "MODIFICACION",
                                    "comercioElectronico": "false",
                                    "metodo": "POST",
                                    "modo": "ASINCRONICO",
                                    "id": "desconectar_cta_permanente",
                                    "alteraPerfilServicio": "NO",
                                    "parametros": {
                                        "Cuenta de acceso": {
                                            "nombre": "Cuenta de acceso",
                                            "parametro": "accessLogin",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Contraseña": {
                                            "nombre": "Contraseña",
                                            "parametro": "password",
                                            "valor": "",
                                            "tipo": "PASSWORD",
                                            "orden": "2"
                                        }
                                    }
                                },
                                "Conexiones": {
                                    "operacion": "Conexiones",
                                    "url": "queryAccessUse",
                                    "tipo": "CONSULTA",
                                    "comercioElectronico": "false",
                                    "metodo": "GET",
                                    "modo": "ASINCRONICO",
                                    "id": "query_access_use",
                                    "alteraPerfilServicio": "NO",
                                    "parametros": {
                                        "Cuenta de acceso": {
                                            "nombre": "Cuenta de acceso",
                                            "parametro": "accessLogin",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Mes": {
                                            "nombre": "Mes",
                                            "parametro": "mes",
                                            "valor": "7",
                                            "tipo": "SELECT",
                                            "orden": "2",
                                            "valores": {
                                                "5": "Mayo",
                                                "6": "Junio",
                                                "7": "Julio"
                                            }
                                        },
                                        "pagina": {
                                            "nombre": "pagina",
                                            "parametro": "pagina",
                                            "valor": "0",
                                            "tipo": "NUMERIC",
                                            "orden": "3"
                                        },
                                        "Elementos por páginas": {
                                            "nombre": "Elementos por páginas",
                                            "parametro": "itemsPorPagina",
                                            "valor": "0",
                                            "tipo": "NUMERIC",
                                            "orden": "4"
                                        }
                                    }
                                },
                                "Recargas": {
                                    "operacion": "Recargas",
                                    "url": "queryRecargas",
                                    "tipo": "CONSULTA",
                                    "comercioElectronico": "false",
                                    "metodo": "GET",
                                    "modo": "SINCRONICO",
                                    "id": "query_recharges",
                                    "alteraPerfilServicio": "NO",
                                    "parametros": {
                                        "Cuenta de acceso": {
                                            "nombre": "Cuenta de acceso",
                                            "parametro": "accessLogin",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Mes": {
                                            "nombre": "Mes",
                                            "parametro": "mes",
                                            "valor": "7",
                                            "tipo": "SELECT",
                                            "orden": "2",
                                            "valores": {
                                                "5": "Mayo",
                                                "6": "Junio",
                                                "7": "Julio"
                                            }
                                        },
                                        "pagina": {
                                            "nombre": "pagina",
                                            "parametro": "pagina",
                                            "valor": "0",
                                            "tipo": "NUMERIC",
                                            "orden": "3"
                                        },
                                        "Elementos por páginas": {
                                            "nombre": "Elementos por páginas",
                                            "parametro": "itemsPorPagina",
                                            "valor": "0",
                                            "tipo": "NUMERIC",
                                            "orden": "4"
                                        }
                                    }
                                },
                                "Transferencias": {
                                    "operacion": "Transferencias",
                                    "url": "queryTransferencias",
                                    "tipo": "CONSULTA",
                                    "comercioElectronico": "false",
                                    "metodo": "GET",
                                    "modo": "SINCRONICO",
                                    "id": "query_transfer",
                                    "alteraPerfilServicio": "NO",
                                    "parametros": {
                                        "Cuenta de acceso": {
                                            "nombre": "Cuenta de acceso",
                                            "parametro": "accessLogin",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Mes": {
                                            "nombre": "Mes",
                                            "parametro": "mes",
                                            "valor": "7",
                                            "tipo": "SELECT",
                                            "orden": "2",
                                            "valores": {
                                                "5": "Mayo",
                                                "6": "Junio",
                                                "7": "Julio"
                                            }
                                        },
                                        "pagina": {
                                            "nombre": "pagina",
                                            "parametro": "pagina",
                                            "valor": "0",
                                            "tipo": "NUMERIC",
                                            "orden": "3"
                                        },
                                        "Elementos por páginas": {
                                            "nombre": "Elementos por páginas",
                                            "parametro": "itemsPorPagina",
                                            "valor": "0",
                                            "tipo": "NUMERIC",
                                            "orden": "4"
                                        }
                                    }
                                },
                                "Recargar cuenta en Línea": {
                                    "operacion": "Recargar cuenta en Línea",
                                    "url": "recargaOnline",
                                    "tipo": "RECARGA",
                                    "comercioElectronico": "true",
                                    "metodo": "POST",
                                    "modo": "ASINCRONICO",
                                    "id": "recharge_online",
                                    "alteraPerfilServicio": "SIMPLE",
                                    "parametros": {
                                        "Cuenta de acceso": {
                                            "nombre": "Cuenta de acceso",
                                            "parametro": "cuentaAcceso",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Saldo": {
                                            "nombre": "Saldo",
                                            "parametro": "monto",
                                            "valor": "",
                                            "tipo": "MONEY",
                                            "orden": "2"
                                        },
                                        "Pasarela": {
                                            "nombre": "Pasarela",
                                            "parametro": "pasarela",
                                            "valor": "",
                                            "tipo": "SELECT",
                                            "orden": "3",
                                            "valores": {
                                                "TRANSFERMOVIL": "Transfermóvil"
                                            }
                                        }
                                    }
                                },
                                "Recargar cuenta con cupón": {
                                    "operacion": "Recargar cuenta con cupón",
                                    "url": "recargarConCupon",
                                    "tipo": "RECARGA",
                                    "comercioElectronico": "false",
                                    "metodo": "POST",
                                    "modo": "ASINCRONICO",
                                    "id": "recharge_voucher",
                                    "alteraPerfilServicio": "SIMPLE",
                                    "parametros": {
                                        "Cuenta de acceso": {
                                            "nombre": "Cuenta de acceso",
                                            "parametro": "accessLogin",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Pin": {
                                            "nombre": "Pin",
                                            "parametro": "cardPassword",
                                            "valor": "",
                                            "tipo": "STRING",
                                            "orden": "2"
                                        }
                                    }
                                },
                                "Recuperar contraseña": {
                                    "operacion": "Recuperar contraseña",
                                    "url": "recuperarPasswordAcceso",
                                    "tipo": "RECUPERAR_PASSWORD",
                                    "comercioElectronico": "false",
                                    "metodo": "POST",
                                    "modo": "ASINCRONICO",
                                    "id": "recuperar_password_acceso",
                                    "alteraPerfilServicio": "NO",
                                    "parametros": {
                                        "Cuenta de acceso": {
                                            "nombre": "Cuenta de acceso",
                                            "parametro": "cuenta",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Código de chequeo": {
                                            "nombre": "Código de chequeo",
                                            "parametro": "codigo",
                                            "valor": "",
                                            "tipo": "STRING",
                                            "orden": "2"
                                        },
                                        "Contraseña": {
                                            "nombre": "Contraseña",
                                            "parametro": "password",
                                            "valor": "",
                                            "tipo": "PASSWORD",
                                            "orden": "3"
                                        }
                                    }
                                },
                                "Transferir saldo": {
                                    "operacion": "Transferir saldo",
                                    "url": "transferirSaldo",
                                    "tipo": "TRANSFERENCIA",
                                    "comercioElectronico": "false",
                                    "metodo": "POST",
                                    "modo": "ASINCRONICO",
                                    "id": "transfer_saldo",
                                    "alteraPerfilServicio": "COMBINADO",
                                    "parametros": {
                                        "Cuenta Origen": {
                                            "nombre": "Cuenta Origen",
                                            "parametro": "accessLogin",
                                            "valor": "pedroomar.casabella@nauta.com.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Cuenta Destino": {
                                            "nombre": "Cuenta Destino",
                                            "parametro": "targetLogin",
                                            "valor": "",
                                            "tipo": "STRING",
                                            "orden": "2"
                                        },
                                        "Contraseña": {
                                            "nombre": "Contraseña",
                                            "parametro": "accessPassword",
                                            "valor": "",
                                            "tipo": "PASSWORD",
                                            "orden": "3"
                                        },
                                        "Saldo": {
                                            "nombre": "Saldo",
                                            "parametro": "monto",
                                            "valor": "",
                                            "tipo": "MONEY",
                                            "orden": "4"
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "Correo Nauta": {
                        "pedroomar.casabella@nauta.cu": {
                            "perfil": {
                                "Fecha de venta": "20-03-2017",
                                "Cuenta de correo": "pedroomar.casabella@nauta.cu",
                                "Moneda": "CUP",
                                "id": "17015138249"
                            },
                            "tipoProducto": "CORREO",
                            "operaciones": {
                                "Cambiar contraseña": {
                                    "operacion": "Cambiar contraseña",
                                    "url": "changeMailPassword",
                                    "tipo": "CAMBIO_PASSWORD",
                                    "comercioElectronico": "false",
                                    "metodo": "POST",
                                    "modo": "ASINCRONICO",
                                    "id": "change_passw_email",
                                    "alteraPerfilServicio": "NO",
                                    "parametros": {
                                        "Cuenta de correo": {
                                            "nombre": "Cuenta de correo",
                                            "parametro": "cuenta",
                                            "valor": "pedroomar.casabella@nauta.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Contraseña anterior": {
                                            "nombre": "Contraseña anterior",
                                            "parametro": "oldPassword",
                                            "valor": "",
                                            "tipo": "PASSWORD",
                                            "orden": "2"
                                        },
                                        "Contraseña nueva": {
                                            "nombre": "Contraseña nueva",
                                            "parametro": "newPassword",
                                            "valor": "",
                                            "tipo": "NEWPASSWORD",
                                            "orden": "3"
                                        }
                                    }
                                },
                                "Recuperar contraseña": {
                                    "operacion": "Recuperar contraseña",
                                    "url": "recuperarPasswordCorreo",
                                    "tipo": "RECUPERAR_PASSWORD",
                                    "comercioElectronico": "false",
                                    "metodo": "POST",
                                    "modo": "ASINCRONICO",
                                    "id": "recuperar_password_correo",
                                    "alteraPerfilServicio": "NO",
                                    "parametros": {
                                        "Cuenta de correo": {
                                            "nombre": "Cuenta de correo",
                                            "parametro": "cuenta",
                                            "valor": "pedroomar.casabella@nauta.cu",
                                            "tipo": "STRING",
                                            "orden": "1"
                                        },
                                        "Código de chequeo": {
                                            "nombre": "Código de chequeo",
                                            "parametro": "codigo",
                                            "valor": "",
                                            "tipo": "STRING",
                                            "orden": "2"
                                        },
                                        "Contraseña": {
                                            "nombre": "Contraseña",
                                            "parametro": "password",
                                            "valor": "",
                                            "tipo": "PASSWORD",
                                            "orden": "3"
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "Servicios móviles": {
                        "5351872843": {
                            "perfil": {
                                "id": "5351872843",
                                "Número de Teléfono": "51872843",
                                "Estado": "Activo",
                                "Saldo Principal": "10.00",
                                "Fecha de Venta": "19/8/2022",
                                "Fecha de Bloqueo": "19/6/2024",
                                "Fecha de Eliminación": "19/7/2024",
                                "Internet": "DESHABILITADO",
                                "4G": "DESHABILITADO",
                                "Adelanta Saldo": "0",
                                "Tarifa por Consumo": "NO DEFINIDO",
                                "Moneda": "CUP",
                                "Listas": {
                                    "Planes": {
                                        "3": {
                                            "tipo": "MINUTOS",
                                            "Vence": "24/08/2023",
                                            "Datos": "01: 000: 22: 40: 00"
                                        },
                                        "4": {
                                            "tipo": "SMS",
                                            "Vence": "24/08/2023",
                                            "Datos": "1480"
                                        },
                                        "7": {
                                            "tipo": "DATOS",
                                            "Vence": "24/08/2023",
                                            "Datos": "3.50 GB"
                                        },
                                        "20": {
                                            "tipo": "DATOS LTE",
                                            "Vence": "24/08/2023",
                                            "Datos": "4.35 GB"
                                        }
                                    },
                                    "Bonos": {
                                        "16": {
                                            "tipo": "DATOS NACIONALES",
                                            "Fecha inicio": "",
                                            "Vence": "24/08/2023",
                                            "Datos": "299.77 MB"
                                        },
                                        "23": {
                                            "tipo": "DATOS LTE",
                                            "Fecha inicio": "18/03/2023",
                                            "Vence": "24/08/2023",
                                            "Datos": "0"
                                        }
                                    }
                                }
                            },
                            "operaciones": {}
                        },
                        "5355627579": {
                            "perfil": {
                                "id": "5355627579",
                                "Número de Teléfono": "55627579",
                                "Estado": "Activo",
                                "Saldo Principal": "54.14",
                                "Fecha de Venta": "29/8/2016",
                                "Fecha de Bloqueo": "9/6/2024",
                                "Fecha de Eliminación": "9/7/2024",
                                "Internet": "HABILITADO",
                                "4G": "HABILITADO",
                                "Adelanta Saldo": "0",
                                "Tarifa por Consumo": "NO DEFINIDO",
                                "Moneda": "CUP",
                                "Listas": {
                                    "Planes": {
                                        "3": {
                                            "tipo": "MINUTOS",
                                            "Vence": "14/08/2023",
                                            "Datos": "01: 000: 08: 12: 54"
                                        },
                                        "4": {
                                            "tipo": "SMS",
                                            "Vence": "14/08/2023",
                                            "Datos": "540"
                                        },
                                        "7": {
                                            "tipo": "DATOS",
                                            "Vence": "14/08/2023",
                                            "Datos": "6.12 GB"
                                        },
                                        "20": {
                                            "tipo": "DATOS LTE",
                                            "Vence": "14/08/2023",
                                            "Datos": "1.00 B"
                                        }
                                    },
                                    "Bonos": {
                                        "16": {
                                            "tipo": "DATOS NACIONALES",
                                            "Fecha inicio": "",
                                            "Vence": "14/08/2023",
                                            "Datos": "283.69 MB"
                                        },
                                        "23": {
                                            "tipo": "DATOS LTE",
                                            "Fecha inicio": "09/05/2023",
                                            "Vence": "14/08/2023",
                                            "Datos": "0"
                                        },
                                        "24": {
                                            "tipo": "BONO DATOS INTER",
                                            "Fecha inicio": "",
                                            "Vence": "14/08/2023",
                                            "Datos": "24.53 GB"
                                        }
                                    }
                                }
                            },
                            "operaciones": {}
                        },
                        "5350183539": {
                            "perfil": {
                                "id": "5350183539",
                                "Número de Teléfono": "50183539",
                                "Estado": "Activo",
                                "Saldo Principal": "305.09",
                                "Fecha de Venta": "25/7/2023",
                                "Fecha de Bloqueo": "13/6/2024",
                                "Fecha de Eliminación": "13/7/2024",
                                "Internet": "DESHABILITADO",
                                "4G": "DESHABILITADO",
                                "Adelanta Saldo": "0",
                                "Tarifa por Consumo": "NO DEFINIDO",
                                "Moneda": "CUP",
                                "Listas": {
                                    "Planes": {
                                        "3": {
                                            "tipo": "MINUTOS",
                                            "Vence": "14/08/2023",
                                            "Datos": ""
                                        },
                                        "4": {
                                            "tipo": "SMS",
                                            "Vence": "14/08/2023",
                                            "Datos": "59"
                                        },
                                        "7": {
                                            "tipo": "DATOS",
                                            "Vence": "14/08/2023",
                                            "Datos": "2.08 GB"
                                        },
                                        "20": {
                                            "tipo": "DATOS LTE",
                                            "Vence": "14/08/2023",
                                            "Datos": "1.91 GB"
                                        }
                                    },
                                    "Bonos": {
                                        "16": {
                                            "tipo": "DATOS NACIONALES",
                                            "Fecha inicio": "",
                                            "Vence": "14/08/2023",
                                            "Datos": "300 MB"
                                        },
                                        "23": {
                                            "tipo": "DATOS LTE",
                                            "Fecha inicio": "06/07/2023",
                                            "Vence": "14/08/2023",
                                            "Datos": "0"
                                        },
                                        "24": {
                                            "tipo": "BONO DATOS INTER",
                                            "Fecha inicio": "",
                                            "Vence": "14/08/2023",
                                            "Datos": "29.37 GB"
                                        }
                                    }
                                }
                            },
                            "operaciones": {}
                        }
                    },
                    "Telefonía fija": {}
                },
                "servicios_actualizados": "false",
                "completado": "true",
                "fechaActualizacion": "2023-07-25 19: 50: 05"
            },
            "resultado": "ok"
        }
    }
    """

let userResponseWithoutServices = """
    {
        "resp": {
            "user": {
                "cliente": {
                    "nombre": "pedro omar casabella lemus",
                    "telefono": "55627579",
                    "email": "pocl9812@gmail.com",
                    "notificaciones_mail": "false",
                    "notificaciones_movil": "true",
                    "usuario_portal": "+5355627579",
                    "operaciones": {
                        "Pagos electrónicos en el portal": {
                            "operacion": "Pagos electrónicos en el portal",
                            "url": "queryPagosOnLine",
                            "tipo": "CONSULTA",
                            "comercioElectronico": "false",
                            "metodo": "GET",
                            "modo": "ASINCRONICO",
                            "id": "query_pago_operaciones",
                            "alteraPerfilServicio": "NO",
                            "parametros": {
                                "Cliente Id": {
                                    "nombre": "Cliente Id",
                                    "parametro": "clienteId",
                                    "valor": "1ea1c323-a233-4a5f-a6b0-57597eb711eb",
                                    "tipo": "STRING",
                                    "orden": "1"
                                },
                                "Fecha": {
                                    "nombre": "Fecha",
                                    "parametro": "fecha",
                                    "valor": "",
                                    "tipo": "DATETIME",
                                    "orden": "2"
                                },
                                "pagina": {
                                    "nombre": "pagina",
                                    "parametro": "pagina",
                                    "valor": "0",
                                    "tipo": "NUMERIC",
                                    "orden": "3"
                                },
                                "Elementos por páginas": {
                                    "nombre": "Elementos por páginas",
                                    "parametro": "itemsPorPagina",
                                    "valor": "0",
                                    "tipo": "NUMERIC",
                                    "orden": "4"
                                }
                            }
                        },
                        "Crear cuenta de navegación (@nauta.com.cu)": {
                            "operacion": "Crear cuenta de navegación (@nauta.com.cu)",
                            "url": "crearCuentaAcceso",
                            "tipo": "ALTA",
                            "comercioElectronico": "false",
                            "metodo": "POST",
                            "modo": "ASINCRONICO",
                            "id": "create_cta_permanente",
                            "alteraPerfilServicio": "NO",
                            "parametros": {
                                "Tipo de servicio": {
                                    "nombre": "Tipo de servicio",
                                    "parametro": "especificacionProductoId",
                                    "valor": "100",
                                    "tipo": "STRING",
                                    "orden": "4"
                                },
                                "Cuenta de navegación": {
                                    "nombre": "Cuenta de navegación",
                                    "parametro": "cuenta",
                                    "valor": "",
                                    "tipo": "STRING",
                                    "orden": "1"
                                },
                                "Contraseña": {
                                    "nombre": "Contraseña",
                                    "parametro": "password",
                                    "valor": "",
                                    "tipo": "NEWPASSWORD",
                                    "orden": "2"
                                },
                                "Cliente": {
                                    "nombre": "Cliente",
                                    "parametro": "clienteId",
                                    "valor": "1ea1c323-a233-4a5f-a6b0-57597eb711eb",
                                    "tipo": "STRING",
                                    "orden": "3"
                                }
                            }
                        },
                        "Crear cuenta de correo (@nauta.cu)": {
                            "operacion": "Crear cuenta de correo (@nauta.cu)",
                            "url": "crearCuentaCorreo",
                            "tipo": "ALTA",
                            "comercioElectronico": "false",
                            "metodo": "POST",
                            "modo": "ASINCRONICO",
                            "id": "create_email",
                            "alteraPerfilServicio": "NO",
                            "parametros": {
                                "Tipo de servicio": {
                                    "nombre": "Tipo de servicio",
                                    "parametro": "especificacionProductoId",
                                    "valor": "correo",
                                    "tipo": "STRING",
                                    "orden": "4"
                                },
                                "Cuenta de correo": {
                                    "nombre": "Cuenta de correo",
                                    "parametro": "cuenta",
                                    "valor": "",
                                    "tipo": "STRING",
                                    "orden": "1"
                                },
                                "Contraseña": {
                                    "nombre": "Contraseña",
                                    "parametro": "password",
                                    "valor": "",
                                    "tipo": "NEWPASSWORD",
                                    "orden": "2"
                                },
                                "Cliente": {
                                    "nombre": "Cliente",
                                    "parametro": "clienteId",
                                    "valor": "1ea1c323-a233-4a5f-a6b0-57597eb711eb",
                                    "tipo": "STRING",
                                    "orden": "3"
                                }
                            }
                        },
                        "Operaciones realizadas en el portal": {
                            "operacion": "Operaciones realizadas en el portal",
                            "url": "queryOperations",
                            "tipo": "CONSULTA",
                            "comercioElectronico": "false",
                            "metodo": "GET",
                            "modo": "ASINCRONICO",
                            "id": "query_operations",
                            "alteraPerfilServicio": "NO",
                            "parametros": {
                                "Cliente Id": {
                                    "nombre": "Cliente Id",
                                    "parametro": "clienteId",
                                    "valor": "1ea1c323-a233-4a5f-a6b0-57597eb711eb",
                                    "tipo": "STRING",
                                    "orden": "1"
                                },
                                "Fecha": {
                                    "nombre": "Fecha",
                                    "parametro": "fecha",
                                    "valor": "",
                                    "tipo": "DATETIME",
                                    "orden": "2"
                                },
                                "pagina": {
                                    "nombre": "pagina",
                                    "parametro": "pagina",
                                    "valor": "0",
                                    "tipo": "NUMERIC",
                                    "orden": "3"
                                },
                                "Elementos por páginas": {
                                    "nombre": "Elementos por páginas",
                                    "parametro": "itemsPorPagina",
                                    "valor": "0",
                                    "tipo": "NUMERIC",
                                    "orden": "4"
                                }
                            }
                        }
                    }
                },
                "Servicios": "",
                "servicios_actualizados": "false",
                "completado": "true",
                "fechaActualizacion": "2023-07-25 19: 50: 05"
            },
            "resultado": "ok"
        }
    }
    """

let connects = """
    {
        "data": {
            "resultado": "OK",
            "total": 6,
            "resumen": {
                "Cantidad Conexiones": 6,
                "Tiempo Total": "04:05:29",
                "Importe Total": 48.51,
                "Total Subida": "69.95 MB",
                "Total Bajada": "799.31 MB",
                "Tráfico Total": "869.26 MB"
            },
            "desglose": {
                "titulos": {
                    "1": "Inicio",
                    "2": "Fin",
                    "3": "Tiempo consumido",
                    "4": "Importe",
                    "5": "Tráfico bajada",
                    "6": "Tráfico subida",
                    "7": "Puerto"
                },
                "datos": {
                    "0": {
                        "1": "11/05/2023 07:07:20",
                        "2": "11/05/2023 07:07:47",
                        "3": "00:00:27",
                        "4": 0.09,
                        "5": "0",
                        "6": "41.00 KB",
                        "7": "64:d1:54:93:37:3a"
                    },
                    "1": {
                        "1": "11/05/2023 06:33:34",
                        "2": "11/05/2023 07:07:12",
                        "3": "00:33:38",
                        "4": 6.73,
                        "5": "126.21 MB",
                        "6": "10.92 MB",
                        "7": "64:d1:54:93:37:3a"
                    },
                    "2": {
                        "1": "10/05/2023 12:17:06",
                        "2": "10/05/2023 15:39:30",
                        "3": "03:22:24",
                        "4": 40.48,
                        "5": "644.15 MB",
                        "6": "54.18 MB",
                        "7": "64:d1:54:93:37:3a"
                    },
                    "3": {
                        "1": "08/05/2023 13:51:12",
                        "2": "08/05/2023 13:55:55",
                        "3": "00:04:43",
                        "4": 0.95,
                        "5": "21.02 MB",
                        "6": "2.33 MB",
                        "7": "64:d1:54:93:37:3a"
                    },
                    "4": {
                        "1": "06/05/2023 22:48:12",
                        "2": "06/05/2023 22:51:05",
                        "3": "00:02:53",
                        "4": 0.26,
                        "5": "4.77 MB",
                        "6": "1.38 MB",
                        "7": "64:d1:54:93:37:3a"
                    },
                    "5": {
                        "1": "06/05/2023 22:45:34",
                        "2": "06/05/2023 22:46:58",
                        "3": "00:01:24",
                        "4": 0,
                        "5": "3.17 MB",
                        "6": "1.10 MB",
                        "7": "64:d1:54:93:37:3a"
                    }
                }
            }
        }
    }
    """

let lists = """
    {
      "id": "5350183539",
      "Número de Teléfono": "50183539",
      "Estado": "Activo",
      "Saldo Principal": "305.09",
      "Fecha de Venta": "25/7/2023",
      "Fecha de Bloqueo": "13/6/2024",
      "Fecha de Eliminación": "13/7/2024",
      "Internet": "DESHABILITADO",
      "4G": "DESHABILITADO",
      "Adelanta Saldo": "0",
      "Tarifa por Consumo": "NO DEFINIDO",
      "Moneda": "CUP",
      "Listas": {
          "Planes": {
              "3": {
                  "tipo": "MINUTOS",
                  "Vence": "14/08/2023",
                  "Datos": ""
              },
              "4": {
                  "tipo": "SMS",
                  "Vence": "14/08/2023",
                  "Datos": "59"
              },
              "7": {
                  "tipo": "DATOS",
                  "Vence": "14/08/2023",
                  "Datos": "2.08 GB"
              },
              "20": {
                  "tipo": "DATOS LTE",
                  "Vence": "14/08/2023",
                  "Datos": "1.91 GB"
              }
          },
          "Bonos": {
              "16": {
                  "tipo": "DATOS NACIONALES",
                  "Fecha inicio": "",
                  "Vence": "14/08/2023",
                  "Datos": "300 MB"
              },
              "23": {
                  "tipo": "DATOS LTE",
                  "Fecha inicio": "06/07/2023",
                  "Vence": "14/08/2023",
                  "Datos": "0"
              },
              "24": {
                  "tipo": "BONO DATOS INTER",
                  "Fecha inicio": "",
                  "Vence": "14/08/2023",
                  "Datos": "29.37 GB"
              }
          }
      }
    }
    """

// MARK: - Change Pass Json

let changePassJson = """
{
    "param":[
{
    "name":"cuenta",
    "value":"+5355627579"},
{
    "name":"password",
    "value":"Carking*2023"
},
{
    "name":"codigoActivacion",
    "value":"AU9MI"
}
    ]
}
"""

// MARK: - userValid Json

let userValidJson = """
    {
    "param":[
        {
            "name":"usuarioPortal",
            "value":"+5355627579"
        }
    ],
    "idRequest":"6f56767ff346ad44cef872037749d5fbc6a05639",
    "captchatext":"AR4RWU"
}
"""

let dataResponse = """
    {
        "data":{
        "resultado":"OK"
        }
    }
"""

// MARK: - numberValid Json

let numberValidJson = """
    {
    "param":[
        {
            "name":"usuarioPortal",
            "value":"+5355627579"
        },{
            "name":"codigoActivacion",
            "value":"AU9MI"}
    ]
}
"""

// MARK: - Register User Json

let registerUserJson = """
    {
        "param":[
            {
                "name":"via","value":"SERVICIO_MOVIL"
            },
            {
                "name":"noIdentidad","value":"62113005642"
            },
        {
            "name":"servicio","value":"+5354609692"
        }
        ],
        "idRequest":"954fd6ae083d13cfa8ca1d3ba4fc964f2ec9e307",
        "captchatext":"YTXRQG"
    }
"""

// MARK: - Validate Code User

let paramsJson = """
    {
        "param":[
        {
            "name":"identidad",
            "value":"62113005642"
        },{
            "name":"codigoActivacion",
            "value":"EYKQC"
        }
    ]}
"""

// MARK: - Create User

let paramJson = """
    {
        "param":[
            {
                "name":"usuario",
                "value":"+5354609692"
            },{
                "name":"password",
                "value":"Omar*1962"
            },{
                "name":"noIdentidad",
                "value":"62113005642"
            }]
    }
"""



