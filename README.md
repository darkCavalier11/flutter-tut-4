# tut_4
## Provider
provier work as a wrap around the widget and the inside wrapper get the data of the wrapper. wrapper are ChangeNotifiers and the widget inside it rebuilts. 

### Listening data
```
Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'My App',
        ...
```
Here the Product is a model provider holding the state data. when first loaded Products get instantiated and populated to the widget. when creating widget from a list it is recommended that a .value default constructor should be used to avoid bougs and unusual behavior. here value is used because we do not need to instantiate the products[i]. each item in the list get a ChangeNotifier parent.
```
itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
```

### getting data in a widget in widget tree
fetching the data from state using Provider with type Products.
```
final productsData = Provider.of<Products>(context);
```
also the following code can be used where we need to render a part of the widget tree rather than the entire tree.
```
    ....
    Consumer<Product>(
      builder: (ctx, product, child) {
          return Widget(...)
      }
    ...
```
the child above is the widget you donot want to rebuild everytime product changes. here is an example. here only the Badge's value rebuilts and not the icon
```
Consumer<Cart>(
  builder: (context, cart, child) => Badge(
    child: child,
    value: cart.itemCount.toString(),
  ),
  child: IconButton(
    icon: Icon(Icons.shopping_cart),
    onPressed: null,
  ),
)
```

handle temporary state with StatefulWidget is a better choice.