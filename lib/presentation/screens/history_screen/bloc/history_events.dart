// doc:
// parent class for all events of a history bloc.
// app is simple, so there is only one inheritor
abstract class HistoryEvent {}

class LoadHistoryEvent extends HistoryEvent {}
