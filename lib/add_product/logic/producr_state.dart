class AddProductState {
  final bool isloading;
  String? name;
  AddProductState({
    this.isloading = false,
    this.name,
  });
  AddProductState copywith({
    bool? isloading,
    String? name,
  }) {
    return AddProductState(
      isloading: isloading ?? this.isloading,
      name: name ?? this.name,
    );
  }
}
