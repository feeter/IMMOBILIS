function formatearRut(rut)
{
    var sRutFormateado = '';

    rut = desformatearRut(rut);

    var dv = rut.charAt(rut.length - 1);
    rut = rut.substring(0, rut.length - 1);

    while (rut.length > 3) {
        sRutFormateado = "." + rut.substr(rut.length - 3) + sRutFormateado;
        rut = rut.substring(0, rut.length - 3);
    }

    sRutFormateado = rut + sRutFormateado + "-" + dv;

    return sRutFormateado;
}

function desformatearRut(rut)
{
    while (rut.indexOf(".") != -1) {
        rut = rut.replace(".", "");
    }

    while (rut.indexOf("-") != -1) {
        rut = rut.replace("-", "");
    }

    return rut;
}

function validarRut(s, e) {
    if (check_rut(e.Value.substring(0, e.Value.length - 1), e.Value.substring(e.Value.length - 1, e.Value.length))) {
        e.IsValid = true;
    }
    else {
        e.IsValid = false;
    }
}

function check_rut(rut, dv) {
    dig_ver = dv;
    var monto = ""
    for (j = 0; j < rut.length; j++) {
        if (rut.charAt(j) != "." && rut.charAt(j) != "-") {
            monto = monto + rut.charAt(j)
        }
    }
    rut = monto;

    if (isNaN(rut)) {
        return (false)
    }

    if (rut.length < 7 || dig_ver == "") {
        return (false)
    }

    if (rut.length < 8)
        numero_rut = "0" + rut
    else
        numero_rut = rut;
    
    v8 = numero_rut.substring(7, 8) * 2;
    v7 = numero_rut.substring(6, 7) * 3;
    v6 = numero_rut.substring(5, 6) * 4;
    v5 = numero_rut.substring(4, 5) * 5;
    v4 = numero_rut.substring(3, 4) * 6;
    v3 = numero_rut.substring(2, 3) * 7;
    v2 = numero_rut.substring(1, 2) * 2;
    v1 = numero_rut.substring(0, 1) * 3;

    suma_rut = v1 + v2 + v3 + v4 + v5 + v6 + v7 + v8;
    resto_rut = suma_rut % 11;

    digito_verificador = 11 - resto_rut;

    if (digito_verificador == 10)
        digito_verificador = "K";
    if (digito_verificador == 11)
        digito_verificador = 0;

    if (digito_verificador == "K") {
        if (digito_verificador != dig_ver.toUpperCase()) {
            return (false)
        }
        else
            return (true);
    }
    else {
        if (digito_verificador != dig_ver) {
            return (false)
        }
        else
            return (true);
    }
}