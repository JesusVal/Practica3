import 'package:flutter/material.dart';
import 'package:noticias/models/noticia.dart';

class ItemNoticia extends StatelessWidget {
  final Noticia noticia;
  ItemNoticia({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Cambiar image.network por Extended Image con place holder en caso de error o mientras descarga la imagen
    return Container(
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  (noticia.urlToImage != null) ? noticia.urlToImage : '',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        (noticia.title != null) ? noticia.title : '',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        (noticia.publishedAt != null)
                            ? noticia.publishedAt
                            : "Sin fecha",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        (noticia.description != null)
                            ? noticia.description
                            : "Sin descripción",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 16),
                      Text(
                        (noticia.author != null) ? noticia.author : "Sin autor",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
