import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/animatedScreens/toyStoreAnimation/ToyModel.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, this.toy, this.onItemAdd}) : super(key: key);

  final ToyModel? toy;
  final VoidCallback? onItemAdd;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _toycarttag = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF1A3365),
                onPrimary: Colors.white,
                onSurface: Colors.grey,
                textStyle: TextStyle(
                    color: Color(0x0FFFBB00), fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                widget.onItemAdd!();
                setState(() {
                  _toycarttag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: Text("Add to Cart"),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            color: Color(0xFFF8F8F8),
            child: Hero(
              tag: widget.toy!.id.toString() + _toycarttag,
              child: OctoImage(
                image: CachedNetworkImageProvider(widget.toy!.image!),
                placeholderBuilder:
                    OctoPlaceholder.blurHash(widget.toy!.blurUrl!),
                errorBuilder: OctoError.icon(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.toy!.title!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Text(
                  widget.toy!.type!,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.toy!.price!,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold, color: Color(0xFF1A3365)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(height: 1.5, letterSpacing: 0.5),
            ),
          ),
        ]),
      ),
    );
  }
}
