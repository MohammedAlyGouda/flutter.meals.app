import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilltersScreen extends StatefulWidget {
  static const routeName = '/fillters';
  final Function saveFillte;
  final Map cruuntFiltter;
  FilltersScreen(this.cruuntFiltter, this.saveFillte);
  @override
  _FilltersScreenState createState() => _FilltersScreenState();
}

class _FilltersScreenState extends State<FilltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  initState() {
    _glutenFree = widget.cruuntFiltter['gluten'];
    _lactoseFree = widget.cruuntFiltter['lactose'];
    _vegan = widget.cruuntFiltter['vegan'];
    _vegetarian = widget.cruuntFiltter['vegetarion'];

    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool valuo, Function fun) {
    return SwitchListTile(
        title: Text(title),
        value: valuo,
        subtitle: Text(subtitle),
        onChanged: fun);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The fillter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedData = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarion': _vegetarian,
              };
              widget.saveFillte(selectedData);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjest your meal selection'),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                'Gluten free',
                'Only include gluten-free meal',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Lactose free',
                'Only include lactose-free meal',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include vegan meal',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'vegetarian',
                'Only include vegetarian meal',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
