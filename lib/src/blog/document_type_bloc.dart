import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class DocumentTypeBloc {
  final repository = Repository();
  final documentType = PublishSubject<DocumentTypeModel>();

  get data => documentType.stream;

  DocumentTypeBloc();

  DocumentTypes() async {
    DocumentTypeModel _documentType = await repository.documents_type();
    documentType.sink.add(_documentType);
  }

  disponse() {
    documentType.close();
  }

}

final blocDocumentType = DocumentTypeBloc();