___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_engage_x_pixel",
  "version": 1,
  "securityGroups": [],
  "displayName": "Engage-X Tag",
  "categories": ["AFFILIATE_MARKETING", "ADVERTISING"],
  "brand": {
    "id": "brand_engage_x",
    "displayName": "Engage-X",
    "thumbnail": ""
  },
  "description": "Add the Engage-X tag to your container to enable prospecting, touchpoint measurement, and performance marketing services.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const url = 'https://a1.engage-x.io/';
injectScript(url, data.gtmOnSuccess, data.gtmOnFailure, url);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://a1.engage-x.io/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Engage-X Tag

This template loads the Engage-X script asynchronously.

The tag is designed for prospecting, touchpoint measurement, and performance marketing use cases.

Version history:
v1.0.0 - Initial release
