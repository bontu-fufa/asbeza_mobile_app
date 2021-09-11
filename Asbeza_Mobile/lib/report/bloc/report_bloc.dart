import 'package:asbeza_mobile_app/item/repository/item-repository.dart';
import 'package:asbeza_mobile_app/report/repository/report-repository.dart';

import 'blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository reportRepository;

  ReportBloc({required this.reportRepository}) : super(ReportLoading());

  @override
  Stream<ReportState> mapEventToState(ReportEvent event) async* {
    if (event is ReportLoad) {
      try {
        yield ReportLoading();
        final reports = await reportRepository.fetchAll();
        yield ReportOperationSuccess(reports);
      } catch (e) {
        print("$e");
        yield ReportOperationFailure();
      }
    }

    if (event is ReportCreate) {
      try {
        await reportRepository.create(event.report);
        final reports = await reportRepository.fetchAll();
        yield ReportOperationSuccess(reports);
      } catch (e) {
        print("$e");
        yield ReportOperationFailure();
      }
    }

    if (event is ReportUpdate) {
      try {
        await reportRepository.update(event.report.id ?? 0, event.report);
        final reports = await reportRepository.fetchAll();
        yield ReportOperationSuccess(reports);
      } catch (e) {
        print("$e");
        yield ReportOperationFailure();
      }
    }

    if (event is ReportDelete) {
      try {
        await reportRepository.delete(event.id);
        final reports = await reportRepository.fetchAll();
        yield ReportOperationSuccess(reports);
      } catch (e) {
        print("$e");
        yield ReportOperationFailure();
      }
    }
  }
}
