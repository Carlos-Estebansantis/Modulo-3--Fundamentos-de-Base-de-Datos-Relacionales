package cuenta;

public class cuenta  implements CuentaBancaria {
private double saldo;

// construtor de saldo 
public cuenta(double saldoInicial) {
	this.saldo = saldoInicial;
}

// funcion @Override para llamar a los metodos 
@override
public void depositar(double cantidad) {
	saldo += cantidad;
}
@override
public void retirar(double cantidad) {
	if (cantidad <= saldo) {
		saldo-= cantidad;
	}else {
		System.out.println(" saldo Isuficiente ");
		}
    }
@override
public double consultaSaldo() {
	return saldo;
}
}
