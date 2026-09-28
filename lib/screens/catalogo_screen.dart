import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../widgets/produto_card.dart';
import 'detalhes_produto_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Produto> produtos = [
    Produto(
      nome: 'Notebook',
      preco: 3500.00,
      descricao: 'Notebook para estudos e trabalho',
      imagem: 'https://picsum.photos/200/200?random=1',
    ),
    Produto(
      nome: 'Smartphone',
      preco: 1800.00,
      descricao: 'Smartphone moderno e rápido',
      imagem: 'https://picsum.photos/200/200?random=2',
    ),
    Produto(
      nome: 'Fone de Ouvido',
      preco: 250.00,
      descricao: 'Fone sem fio com boa qualidade de som',
      imagem: 'https://picsum.photos/200/200?random=3',
    ),
    Produto(
      nome: 'Teclado',
      preco: 180.00,
      descricao: 'Teclado confortável para digitação',
      imagem: 'https://picsum.photos/200/200?random=4',
    ),
    Produto(
      nome: 'Mouse',
      preco: 120.00,
      descricao: 'Mouse ergonômico para computador',
      imagem: 'https://picsum.photos/200/200?random=5',
    ),
  ];

  void adicionarProduto() {
    setState(() {
      produtos.add(
        Produto(
          nome: 'Novo Produto',
          preco: 99.90,
          descricao: 'Produto adicionado à lista',
          imagem: 'https://picsum.photos/200/200?random=10',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ProdutoCard(
            produto: produtos[index],

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesProdutoScreen(
                    produto: produtos[index],
                  ),
                ),
              );
            },

            onDismissed: () {
              final produtoRemovido = produtos[index];

              setState(() {
                produtos.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${produtoRemovido.nome} removido!',
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: adicionarProduto,
        child: const Icon(Icons.add),
      ),
    );
  }
}