# panucci_ristorante

A Flutter project used to practise the creation of responsive layouts and constraints.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Common viewport error
<span style="color: red;">════════ Exception caught by rendering library ═════════════════════════════════</span>
The following assertion was thrown during performResize():  
<span style="color: red;">Vertical viewport was given unbounded height.</span>  
Viewports expand in the scrolling direction to fill their container. In this case, a vertical viewport was given an unlimited amount of vertical space in which to expand. This situation typically happens when a scrollable widget is nested inside another scrollable widget.

### How to reproduce it?
We got this error after trying to put a title (Text widget) in the Highligths screen. While the page had only the ListView as a child everything worked fine, because the list assumed the whole size of the screen. However, after putting the ListView and a Text inside a Column, the ListView lost the size constraint, causing the error.

### How to fix it?
We can wrap the ListView with a SizedBox, and then specify the property height of the box.  
But how to know what value of height we need? One possible solution is to use a CustomScrollView with sliver widgets: 
```dart
  child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(child: Text('Destaques do dia')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return HighlightItem(
                    imageURI: items[index]['image'],
                    itemTitle: items[index]['name'],
                    itemPrice: items[index]['price'],
                    itemDescription: items[index]['description']);
              },
              childCount: items.length,
            ),
          )
        ],
      ),
