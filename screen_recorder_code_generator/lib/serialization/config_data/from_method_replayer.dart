import 'package:screen_recorder_code_generator/method_replayer/config.dart' as method_replayer;
import 'package:screen_recorder_code_generator/serialization/config.dart';

List<Config> createConfigsFromMethodReplayer(List<method_replayer.Config> srcConfigs) {
  return srcConfigs
      .expand((srcConfig) => srcConfig.methods //
          .where((srcMethod) => srcMethod.enableRecord)
          .map((srcMethod) => Config(
                className: srcMethod.recordClassName(srcConfig),
                fields: srcMethod.parameters //
                    .where((srcParam) => srcParam.enableRecord)
                    .map((srcParam) => ConfigField(
                          type: srcParam.type,
                          name: srcParam.name,
                          named: true,
                        ))
                    .toList(),
              )))
      .toList();
}
