/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 *
 * @author Adaulan
 */
public class Pedido {

    private int ID;
    private int IDCliente;
    private Date dataPedido;
    private float valor;
    private String formaDePagamento;
    private int IDEndereco;
    private String status;

    public Pedido(int ID, int IDCliente, Date dataPedido, float valor, String formaDePagamento, int IDEndereco, String status) {
        this.ID = ID;
        this.IDCliente = IDCliente;
        this.dataPedido = dataPedido;
        this.valor = valor;
        this.formaDePagamento = formaDePagamento;
        this.IDEndereco = IDEndereco;
        this.status = status;
    }

    public Pedido() {

    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIDCliente() {
        return IDCliente;
    }

    public void setIDCliente(int IDCliente) {
        this.IDCliente = IDCliente;
    }

    public Date getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(Date dataPedido) {
        this.dataPedido = dataPedido;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getFormaDePagamento() {
        return formaDePagamento;
    }

    public void setFormaDePagamento(String formaDePagamento) {
        this.formaDePagamento = formaDePagamento;
    }

    public int getIDEndereco() {
        return IDEndereco;
    }

    public void setIDEndereco(int IDEndereco) {
        this.IDEndereco = IDEndereco;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String formatarValor(float valor) {
        Locale ptBr = new Locale("pt", "BR");
        String valorString = NumberFormat.getCurrencyInstance(ptBr).format(valor);
        return valorString;
    }

    public String formatarData(Date data) {
        SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
        String novaData = formatador.format(data);
        return novaData;
    }

}
