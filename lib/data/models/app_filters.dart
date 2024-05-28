class FilterP {
  final String title;
  bool isSelected;
  List<String>? exclude;

  FilterP({
    required this.title,
    this.isSelected = false,
    this.exclude,
  });
}

class AppFilters {
  static List<FilterP> pFilters = [
    FilterP(title: 'Veg', exclude: ['Non veg']),
    FilterP(title: 'Spicy', exclude: ['Non spicy']),
    FilterP(title: 'Non spicy', exclude: ['Spicy']),
    FilterP(title: 'My orders'),
    FilterP(title: 'All offers', isSelected: true),
    FilterP(title: 'Best selling'),
    FilterP(title: 'Non veg', exclude: ['Veg']),
  ];

  static void switchFilters(FilterP filter) {
    filter.isSelected = !filter.isSelected;
    if (filter.isSelected && filter.title == 'All offers') {
      for (var f in pFilters) {
        if (f.title != filter.title) {
          f.isSelected = false;
        }
      }
      return;
    } else {
      pFilters.firstWhere((f) => f.title == 'All offers').isSelected = false;
    }
    if (filter.isSelected && filter.exclude != null) {
      for (var f in pFilters) {
        if (filter.exclude!.contains(f.title)) {
          f.isSelected = false;
        }
      }
    }
    //makes list non empty
    final isNotSelected = pFilters.every((f) => f.isSelected == false);
    if (isNotSelected) {
      pFilters.firstWhere((f) => f.title == 'All offers').isSelected = true;
    }
  }
}

