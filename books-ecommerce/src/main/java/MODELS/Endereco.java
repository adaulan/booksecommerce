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
public class Endereco {
    private int ID;
    private int IDUSUARIO;
    private String status;
    private String cep;
    private String cidade;
    private String estado;
    private String endereco;
    private String complemento;

    public Endereco(int ID, int IDUSUARIO, String status, String cep, String cidade, String estado, String endereco, String complemento) {
        this.ID = ID;
        this.IDUSUARIO = IDUSUARIO;
        this.status = status;
        this.cep = cep;
        this.cidade = cidade;
        this.estado = estado;
        this.endereco = endereco;
        this.complemento = complemento;
    }

    public Endereco(int IDUSUARIO, String status, String cep, String cidade, String estado, String endereco, String complemento) {
        this.IDUSUARIO = IDUSUARIO;
        this.status = status;
        this.cep = cep;
        this.cidade = cidade;
        this.estado = estado;
        this.endereco = endereco;
        this.complemento = complemento;
    }

    public Endereco() {
    }
    

    public int getIDUSUARIO() {
        return IDUSUARIO;
    }

    public void setIDUSUARIO(int IDUSUARIO) {
        this.IDUSUARIO = IDUSUARIO;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String STATUS) {
        this.status = STATUS;
    }
    
    public int getID() {
        return ID;
    }
    
    public void setID(int ID){
        this.ID = ID;
    }
    
    public String getCEP() {
        return cep;
    }

    public void setCEP(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

}
