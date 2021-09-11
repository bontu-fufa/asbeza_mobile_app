import 'package:asbeza_mobile_app/report/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReportLoad extends ReportEvent {}

class ReportCreate extends ReportEvent {
  final Report report;

  ReportCreate({required this.report});
}

class ReportUpdate extends ReportEvent {
  final Report report;

  ReportUpdate({required this.report});
}

class ReportDelete extends ReportEvent {
  final Report report;

  ReportDelete({required this.report});
}
