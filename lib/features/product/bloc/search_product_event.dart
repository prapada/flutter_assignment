part of 'search_product_bloc.dart';

sealed class SearchProductEvent extends Equatable {
  const SearchProductEvent();

  @override
  List<Object> get props => [];
}

final class SearchProductQueryChanged extends SearchProductEvent {
  final String query;

  const SearchProductQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}