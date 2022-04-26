___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Google Analytics - Cookieless",
  "categories": ["ANALYTICS"],
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "type",
    "displayName": "Track Type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "pageview",
        "displayValue": "Pageview"
      },
      {
        "value": "event",
        "displayValue": "Event"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "pageview"
  },
  {
    "type": "GROUP",
    "name": "event",
    "displayName": "Event Tracking Parameters",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "eventCategory",
        "displayName": "Category",
        "simpleValueType": true,
        "clearOnCopy": true,
        "alwaysInSummary": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "eventAction",
        "displayName": "Action",
        "simpleValueType": true,
        "alwaysInSummary": true,
        "clearOnCopy": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "eventLabel",
        "displayName": "Label",
        "simpleValueType": true,
        "alwaysInSummary": true,
        "clearOnCopy": true
      },
      {
        "type": "TEXT",
        "name": "eventValue",
        "displayName": "Value",
        "simpleValueType": true,
        "alwaysInSummary": true,
        "clearOnCopy": true
      },
      {
        "type": "SELECT",
        "name": "nonInteraction",
        "displayName": "Non-Interaction Hit",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": 0,
            "displayValue": "False"
          },
          {
            "value": 1,
            "displayValue": "True"
          }
        ],
        "simpleValueType": true
      }
    ],
    "enablingConditions": [
      {
        "paramName": "type",
        "paramValue": "event",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "id",
    "displayName": "Universal Analytics ID",
    "simpleValueType": true,
    "canBeEmptyString": true,
    "alwaysInSummary": true,
    "help": "Universal Analytics ID in stape UA-XXXXXX-Y",
    "valueValidators": [
      {
        "type": "GA_TRACKING_ID"
      },
      {
        "type": "NON_EMPTY"
      }
    ],
    "valueHint": "UA-XXXXXX-Y"
  },
  {
    "type": "GROUP",
    "name": "more",
    "displayName": "More Settings",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "GROUP",
        "name": "Custom Dimensions",
        "displayName": "Custom Dimensions",
        "groupStyle": "ZIPPY_OPEN_ON_PARAM",
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "cd",
            "displayName": "",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Index",
                "name": "index",
                "type": "TEXT",
                "isUnique": true,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Dimension Value",
                "name": "value",
                "type": "TEXT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              }
            ]
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "Custom Metrics",
        "displayName": "Custom Metrics",
        "groupStyle": "ZIPPY_OPEN_ON_PARAM",
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "cm",
            "displayName": "",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Index",
                "name": "index",
                "type": "TEXT",
                "isUnique": true,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Metric Value",
                "name": "value",
                "type": "TEXT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              }
            ]
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "Content Groups",
        "displayName": "Content Groups",
        "groupStyle": "ZIPPY_OPEN_ON_PARAM",
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "cg",
            "displayName": "",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Index",
                "name": "index",
                "type": "TEXT",
                "selectItems": [],
                "valueValidators": [
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ],
                "valueHint": "1",
                "isUnique": true
              },
              {
                "defaultValue": "",
                "displayName": "Content Group",
                "name": "value",
                "type": "TEXT",
                "isUnique": false,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              }
            ]
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');
const sendPixel = require('sendPixel');
const generateRandom = require('generateRandom');
const getTimestampMillis = require('getTimestampMillis');
const Math = require('Math');
const getUrl = require('getUrl'); // protocol, host, port, path, query, extension, fragment
const getReferrerUrl = require('getReferrerUrl');
const encodeUriComponent = require('encodeUriComponent');


const cid = ''+generateRandom(1000000000, 9999999999)+'.'+ Math.round(getTimestampMillis() / 1000);
let p = null;

log(data);


// tracking ID
let payload = 'v=1&t='+data.type+'&tid='+data.id+'&cid='+cid+'&aip=1';



// event params
if (data.type === 'event') {
  payload += '&ec=' + data.eventCategory;
  payload += '&ea=' + data.eventAction;
  if (data.eventLabel) payload += '&el=' + data.eventLabel;
  if (data.eventValue) payload += '&ev=' + data.eventValue;
  payload += '&ni=' + data.nonInteraction;
}



// document host
payload += '&dh=' + encodeUriComponent(getUrl('host'));


// document path, UTM params
let path = getUrl('path');
let query = getUrl('query');
p = query.substring(1).split('&');
query = [];
for (let i = 0; i < p.length; i++) {
  if (p[i].substring(0, 10) === 'utm_source') payload += '&cs=' + p[i].substring(11);
  else if (p[i].substring(0, 10) === 'utm_medium') payload += '&cm=' + p[i].substring(11);
  else if (p[i].substring(0, 12) === 'utm_campaign') payload += '&cn=' + p[i].substring(13);
  else if (p[i].substring(0, 8) === 'utm_term') payload += '&ck=' + p[i].substring(9);
  else if (p[i].substring(0, 11) === 'utm_content') payload += '&cc=' + p[i].substring(12);
  else if (p[i].substring(0, 6) === 'utm_id') payload += '&ci=' + p[i].substring(7);
  else query.push(p[i]);
}
query = query.length > 0 ? ('?' + query.join('&')) : '';
if (path.length > 1 && path.substring(0, path.length - 1)) {
  path = path.substring(0, path.length - 1);
}
payload += '&dp=' + encodeUriComponent(path + query);


// document referrer
p = getReferrerUrl();
if (p) {
  payload += '&dr=' + encodeUriComponent(p);
}




// custom dimensions
p = data.cd || [];
for (let i = 0; i < p.length; i++) {
  if (p[i].value) {
    payload += '&cd' + p[i].index + '=' + encodeUriComponent(p[i].value);
  }
}


// custom metrics
p = data.cm || [];
for (let i = 0; i < p.length; i++) {
  if (p[i].value !== null && p[i].value !== undefined) {
    payload += '&cm' + p[i].index + '=' + encodeUriComponent(p[i].value);
  }
}


// content groups
p = data.cg || [];
for (let i = 0; i < p.length; i++) {
  if (p[i].value) {
    payload += '&cg' + p[i].index + '=' + encodeUriComponent(p[i].value);
  }
}



// send request
sendPixel('https://www.google-analytics.com/collect?'+payload, () => {
  log('GOOGLE ANALYTICS COOKIELESS');
  log('Success in sending request', payload);
  data.gtmOnSuccess();
}, () => {
  log('GOOGLE ANALYTICS COOKIELESS');
  log('Error in sending request', payload);
  data.gtmOnFailure();
});


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_referrer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.google-analytics.com/"
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
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
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

scenarios:
- name: Test run
  code: |-
    const mockData = {
      'type': 'pageview',
      'id': 'UA-1234567-1'
    };

    mock('sendPixel', function(url, onSuccess, onFailure) {
        onSuccess();
    });

    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: Add UTM params
  code: |-
    const mockData = {
      'type': 'pageview',
      'id': 'UA-1234567-1'
    };

    mock('getUrl', function(type) {
      if (type == 'host') {
        return 'www.houseofrezac.com';
      } else if (type == 'path') {
        return '/';
      } else if (type == 'query') {
        return '?bar=1&utm_source=tests&utm_medium=testm&utm_campaign=testc&utm_term=testt&utm_content=testco&utm_id=testid';
      } else {
        return 'XXXXXXXXXXXX';
      }
    });

    let expected = 'https://www.google-analytics.com/collect?v=1&t=pageview&tid=UA-1234567-1&cid=2065507754.1643743525&aip=1&dh=www.houseofrezac.com&cs=tests&cm=testm&cn=testc&ck=testt&cc=testco&ci=testid&dp=%2F%3Fbar%3D1';

    mock('sendPixel', function(url, onSuccess, onFailure) {
      assertThat(url).isEqualTo(expected);
      onSuccess();
    });

    runCode(mockData);
- name: Content Groups
  code: |-
    const mockData = {
      'type': 'pageview',
      "cg":[{"index":"1","value":"xxx1"},{"index":"2","value":"aa2"}],
      'id': 'UA-1234567-1'
    };


    mock('sendPixel', function(url, onSuccess, onFailure) {
      assertThat(url).contains('&cg1=xxx1');
      assertThat(url).contains('&cg2=aa2');
      onSuccess();
    });

    runCode(mockData);
- name: Test event
  code: |-
    const mockData = {
      "type":"event",
      "eventCategory":"Cat",
      "eventAction":"Act",
      "eventLabel":"Lab",
      "eventValue":"123",
      "nonInteraction":1,
      'id': 'UA-1234567-1'
    };


    mock('sendPixel', function(url, onSuccess, onFailure) {
      assertThat(url).contains('&ec=Cat&ea=Act&el=Lab&ev=123&ni=1');
      onSuccess();
    });

    runCode(mockData);
- name: Test event - only category & action
  code: |-
    const mockData = {
      "type":"event",
      "eventCategory":"Cat",
      "eventAction":"Act",
      "nonInteraction":1,
      'id': 'UA-1234567-1'
    };


    mock('sendPixel', function(url, onSuccess, onFailure) {
      assertThat(url).contains('&ec=Cat&ea=Act&ni=1');
      onSuccess();
    });

    runCode(mockData);
setup: |-
  mock('generateRandom', 2065507754);
  mock('getTimestampMillis', 1643743525031);


___NOTES___

Created on 19. 4. 2022 15:49:11
