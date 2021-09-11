import 'package:asbeza_mobile_app/report/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object?> get props => [];
}

class ReportLoading extends ReportState {}

class ReportOperationSuccess extends ReportState {
  final List<dynamic> reports;

  ReportOperationSuccess([this.reports = const []]);

  @override
  List<Object> get props => [reports];
}

class ReportOperationFailure extends ReportState {}
