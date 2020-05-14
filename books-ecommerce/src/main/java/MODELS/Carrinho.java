/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

/**
 *
 * @author Adaulan
 */
public class Carrinho {

    private int ID;
    private int IDProduto;
    private String status;
    private int IDPedido;
    private int quantidade;

    public Carrinho(int ID, int IDProduto, String status, int IDPedido, int quantidade) {
        this.ID = ID;
        this.IDProduto = IDProduto;
        this.status = status;
        this.IDPedido = IDPedido;
        this.quantidade = quantidade;
    }
    
    public Carrinho(int ID, int IDProduto, String status, int IDPedido) {
        this.ID = ID;
        this.IDProduto = IDProduto;
        this.status = status;
        this.IDPedido = IDPedido;
    }

    public Carrinho(int ID, int IDProduto,int quantidade, String status ) {
        this.ID = ID;
        this.IDProduto = IDProduto;
        this.quantidade = quantidade;
        this.status = status;
        
    }

    public Carrinho(int ID, int IDProduto, String status) {
        this.ID = ID;
        this.IDProduto = IDProduto;
        this.status = status;
    }

    public Carrinho() {

    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIDProduto() {
        return IDProduto;
    }

    public void setIDProduto(int IDProduto) {
        this.IDProduto = IDProduto;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getIDPedido() {
        return IDPedido;
    }

    public void setIDPedido(int IDPedido) {
        this.IDPedido = IDPedido;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

}
