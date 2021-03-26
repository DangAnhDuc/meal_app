import 'package:flutter/material.dart';
import 'package:meals_app/screens/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String,bool> currentFilter;
  FiltersScreen(this.currentFilter,this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        subtitle,
      ),
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    _glutenFree= widget.currentFilter['gluten'];
    _lactoseFree= widget.currentFilter['lactose'];
    _vegan= widget.currentFilter['vegan'];
    _vegetarian= widget.currentFilter['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: () {
              final selectedFilters= {
                'gluten': _glutenFree,
                'lactose':_lactoseFree,
                'vegan':_vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(selectedFilters);
            },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection!',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (newValue) => setState(() {
                          _glutenFree = newValue;
                        })),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _lactoseFree,
                    (newValue) => setState(() {
                          _lactoseFree = newValue;
                        })),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _vegetarian,
                    (newValue) => setState(() {
                          _vegetarian = newValue;
                        })),
                _buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                    (newValue) => setState(() {
                          _vegan = newValue;
                        })),
              ],
            ))
          ],
        ));
  }
}
