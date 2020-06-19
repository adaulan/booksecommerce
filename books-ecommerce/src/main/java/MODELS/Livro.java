/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Adaulan
 */
public class Livro implements Serializable {
    
    private Integer ID;
    private String status;
    private String titulo;
    private String autor;
    private String editora;
    private String descricao;
    private String imagem;
    private String imagem1;
    private String imagem2;
    private float valorVenda;
    private float valorCusto;
    private String categoria;
    private Integer quantidade;
    private String data;
    private int paginas;
    private String acabamento;
    private String idioma;
    private String altura;
    private String largura;
    private float peso;
    private String ISBN;
    private String tag;

    public Livro(Integer ID, String status, String titulo, String autor, String editora, String descricao, String imagem, String imagem1, String imagem2, float valorVenda, float valorCusto, String categoria, Integer quantidade, String data, int paginas, String acabamento, String idioma, String altura, String largura, float peso, String ISBN, String tag) {
        this.ID = ID;
        this.status = status;
        this.titulo = titulo;
        this.autor = autor;
        this.editora = editora;
        this.descricao = descricao;
        this.imagem = imagem;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.valorVenda = valorVenda;
        this.valorCusto = valorCusto;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.data = data;
        this.paginas = paginas;
        this.acabamento = acabamento;
        this.idioma = idioma;
        this.altura = altura;
        this.largura = largura;
        this.peso = peso;
        this.ISBN = ISBN;
        this.tag = tag;
    }

    public Livro(String status, String titulo, String autor, String editora, String descricao, String imagem, String imagem1, String imagem2, float valorVenda, float valorCusto, String categoria, Integer quantidade, String data, int paginas, String acabamento, String idioma, String altura, String largura, float peso, String ISBN, String tag) {
        this.status = status;
        this.titulo = titulo;
        this.autor = autor;
        this.editora = editora;
        this.descricao = descricao;
        this.imagem = imagem;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.valorVenda = valorVenda;
        this.valorCusto = valorCusto;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.data = data;
        this.paginas = paginas;
        this.acabamento = acabamento;
        this.idioma = idioma;
        this.altura = altura;
        this.largura = largura;
        this.peso = peso;
        this.ISBN = ISBN;
        this.tag = tag;
    }

    public Livro() {
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getImagem1() {
        return imagem1;
    }

    public void setImagem1(String imagem1) {
        this.imagem1 = imagem1;
    }

    public String getImagem2() {
        return imagem2;
    }

    public void setImagem2(String imagem2) {
        this.imagem2 = imagem2;
    }

    public float getValorVenda() {
        return valorVenda;
    }

    public void setValorVenda(float valorVenda) {
        this.valorVenda = valorVenda;
    }

    public float getValorCusto() {
        return valorCusto;
    }

    public void setValorCusto(float valorCusto) {
        this.valorCusto = valorCusto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getPaginas() {
        return paginas;
    }

    public void setPaginas(int paginas) {
        this.paginas = paginas;
    }

    public String getAcabamento() {
        return acabamento;
    }

    public void setAcabamento(String acabamento) {
        this.acabamento = acabamento;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getAltura() {
        return altura;
    }

    public void setAltura(String altura) {
        this.altura = altura;
    }

    public String getLargura() {
        return largura;
    }

    public void setLargura(String largura) {
        this.largura = largura;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String formatarValor(float valor) {
        Locale ptBr = new Locale("pt", "BR");
        String valorString = NumberFormat.getCurrencyInstance(ptBr).format(valor);
        return valorString;
    }

}
