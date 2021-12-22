Package make to help in internationalization of string labels and messages.

## Getting started

- Included in dependencies
  ```
  dependencies:
    localization:
      path: ./packages/localization
  ```
- Need included assets in pubspec.yaml, default is 'assets/lang/', but can use like you want.
- Default language is en_US.
- The files in 'assets/lang/' are make in json format and compreessed in gzip format.
- Each language must have a diferent file, like en_US.gzip, pt_BR.gzip, etc.
- This files must be two principal nodes called 'labels' and 'messages':
  ```
    {
        'labels': {
            'app-name' : 'My App Name'
        },
        'messages':{
            'error-message' : 'Error in run app.'
        }
    }
  ```
- The Localization must be initialize.


## Usage

```
import 'package:localization/localization.dart';

main(){
  await Localization.configuration(translationLang: 'en_US', translationLocale: 'assets/lang');

  final String appName = Localization.i18nLabels('app-name');
  final String errorMessage = Localization.i18nMessages('error-message');

  print(appName);
  print(errorMessage);
}

```
Using with args:

- The assets file must be change, included a '%s' on the dynamic string.

```
{
    'labels': {
        'app-name' : 'My App Name - %s'
    },
    'messages':{
        'error-message' : 'Error in %s. %s.'
    }
}
```

```
import 'package:localization/localization.dart';

main(){
  await Localization.configuration(translationLang: 'en_US', translationLocale: 'assets/lang');

  final String appName = Localization.i18nLabels('app-name', ['1.0']);
  final String errorMessage = Localization.i18nMessages('error-message', ['file', 'Verify him']);

  print(appName);
  print(errorMessage);
}

output:

My App Name - 1.0
Error in file. Verify him.

```


## Additional information

This package was make with code base on https://github.com/toshiossada/localization

This is a public package.
You can fork then or contribute.

To help in read and convert json files in gzip, I made a side project in https://github.com/phferreira/gzip_compress_decompress
This app get the gzip file and read him, then display in botton a json, or any text, is in.
Than update button save the new changes in gzip format.



