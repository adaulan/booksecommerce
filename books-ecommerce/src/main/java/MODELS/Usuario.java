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
public class Usuario {
    private int ID;
    private String nome;
    private String usuario;
    private String senha;
    private String email;
    private String tipo;
    private String dataNascimento;
    private String celular;

    public Usuario(int ID, String nome, String usuario, String senha, String email, String tipo, String dataNascimento, String celular) {
        this.ID = ID;
        this.nome = nome;
        this.usuario = usuario;
        this.senha = senha;
        this.email = email;
        this.tipo = tipo;
        this.dataNascimento = dataNascimento;
        this.celular = celular;
    }

    public Usuario(String nome, String usuario, String senha, String email, String tipo, String dataNascimento, String celular) {
        this.nome = nome;
        this.usuario = usuario;
        this.senha = senha;
        this.email = email;
        this.tipo = tipo;
        this.dataNascimento = dataNascimento;
        this.celular = celular;
    }

    public Usuario(String nome, String usuario, String senha, String email, String tipo, String dataNascimento) {
        this.nome = nome;
        this.usuario = usuario;
        this.senha = senha;
        this.email = email;
        this.tipo = tipo;
        this.dataNascimento = dataNascimento;
    }
    
    

    public Usuario() {
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }
    
    public boolean validarSenha(String senha){
        if (senha.equals(this.senha)){
            return true;
        } else {
            return false;
        }
    }
    
    
}
