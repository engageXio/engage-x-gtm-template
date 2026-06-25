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
  "displayName": "Engage-X Pixel",
  "brand": {
    "id": "brand_engage_x",
    "displayName": "Engage-X",
    "thumbnail": ""
  },
  "description": "Engage-X Advertising Pixel Tag. Loads the Engage-X tracking script and supports all standard parameters including program ID, page type, product data, transaction data, consent and custom values.",
  "containerContexts": [
    "WEB"
  ]
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "groupBasic",
    "displayName": "Basic Configuration",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "glk_network",
        "displayName": "Network ID",
        "simpleValueType": true,
        "help": "String to identify your network.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "glk_program",
        "displayName": "Program ID",
        "simpleValueType": true,
        "help": "Internal program ID provided by Engage-X.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "glk_pagetype",
        "displayName": "Page Type",
        "simpleValueType": true,
        "help": "Select the page type for this tag configuration.",
        "selectItems": [
          { "value": "START",      "displayValue": "Start / Homepage" },
          { "value": "PRODUCT",    "displayValue": "Product Page" },
          { "value": "CATALOG",    "displayValue": "Catalog / Category Page" },
          { "value": "SEARCH",     "displayValue": "Search Results Page" },
          { "value": "WISHLIST",   "displayValue": "Wishlist Page" },
          { "value": "CART",       "displayValue": "Cart Page" },
          { "value": "CHECKOUT",   "displayValue": "Checkout Page" },
          { "value": "ORDER",      "displayValue": "Order Confirmation Page" },
          { "value": "CONVERSION", "displayValue": "Conversion Page" }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "glk_euconsent",
        "displayName": "EU Consent Value (glk_euconsent)",
        "simpleValueType": true,
        "help": "Pass 1 or TCF consent string if consent is given, or 0 if no consent. This value is passed through as-is without internal consent checking."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "groupProduct",
    "displayName": "Product Data",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "glk_product",
        "displayName": "Product ID (glk_product)",
        "simpleValueType": true,
        "help": "Insert product number on product pages."
      },
      {
        "type": "TEXT",
        "name": "glk_txnproducts",
        "displayName": "Product List (glk_txnproducts)",
        "simpleValueType": true,
        "help": "Comma-separated list of product IDs purchased on order/conversion pages. Example: PROD1,PROD2,PROD3"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "groupTransaction",
    "displayName": "Transaction Data",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "glk_txnid",
        "displayName": "Order / Transaction ID (glk_txnid)",
        "simpleValueType": true,
        "help": "Insert the ID of the purchase on transaction (order) pages."
      },
      {
        "type": "TEXT",
        "name": "glk_txnvalue",
        "displayName": "Order Value (glk_txnvalue)",
        "simpleValueType": true,
        "help": "Insert the value of the transaction on order pages."
      },
      {
        "type": "TEXT",
        "name": "glk_currency",
        "displayName": "Currency (glk_currency)",
        "simpleValueType": true,
        "help": "Insert the currency code of the transaction. Example: EUR, USD, GBP"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "groupCustom",
    "displayName": "Custom Data",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "glk_custom",
        "displayName": "Custom Data (glk_custom)",
        "simpleValueType": true,
        "help": "Optional. String or comma-separated custom values to pass to the pixel."
      }
    ]
  }
]

___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// ─── Require GTM Sandboxed APIs ───────────────────────────────────────────────
var createArgumentsQueue = require('createArgumentsQueue');
var injectScript         = require('injectScript');
var setInWindow          = require('setInWindow');
var copyFromWindow       = require('copyFromWindow');
var makeString           = require('makeString');
var log                  = require('logToConsole');

// ─── Helper: set a window variable only if the value is non-empty ─────────────
function setIfProvided(varName, value) {
  if (value !== undefined && value !== null && makeString(value) !== '') {
    setInWindow(varName, value, true);
  }
}

// ─── 1. Set all pixel parameters on window ────────────────────────────────────

// Basic / Required
setIfProvided('glk_network',    data.glk_network);
setIfProvided('glk_program',    data.glk_program);
setIfProvided('glk_pagetype',   data.glk_pagetype);
setIfProvided('glk_euconsent',  data.glk_euconsent);

// Product
setIfProvided('glk_product',     data.glk_product);
setIfProvided('glk_txnproducts', data.glk_txnproducts);

// Transaction
setIfProvided('glk_txnid',    data.glk_txnid);
setIfProvided('glk_txnvalue', data.glk_txnvalue);
setIfProvided('glk_currency', data.glk_currency);

// Custom
setIfProvided('glk_custom', data.glk_custom);

// ─── 2. Inject the Engage-X pixel script ──────────────────────────────────────
var PIXEL_URL = 'https://a1.engage-x.io/';

injectScript(
  PIXEL_URL,
  data.gtmOnSuccess,   // called when script loads successfully
  data.gtmOnFailure,   // called when script fails to load
  PIXEL_URL            // cache token — GTM will not inject the same URL twice
);

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
                "string": "https://a1.engage-x.io/"
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
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_network"},   {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_program"},    {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_pagetype"},   {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_euconsent"},  {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_product"},    {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_txnproducts"},{"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_txnid"},      {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_txnvalue"},   {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_currency"},   {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] },
              { "type": 3, "mapKey": [{"type":1,"string":"key"},{"type":1,"string":"read"},{"type":1,"string":"write"},{"type":1,"string":"execute"}], "mapValue": [{"type":1,"string":"glk_custom"},     {"type":8,"boolean":false},{"type":8,"boolean":true},{"type":8,"boolean":false}] }
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

___NOTES___

This template loads the Engage-X advertising pixel (https://a1.engage-x.io/) and
supports the following window-level parameters:

REQUIRED:
  glk_network    — Network identifier string
  glk_program    — Internal Engage-X program ID
  glk_pagetype   — Page type: START | PRODUCT | CATALOG | SEARCH |
                              WISHLIST | CART | CHECKOUT | ORDER | CONVERSION

OPTIONAL — passed only when non-empty:
  glk_euconsent  — EU consent value (1 / TCF string = consent given, 0 = no consent).
                   Passed through as-is; no internal consent check is performed.
  glk_product    — Single product ID (product pages)
  glk_txnproducts— Comma-separated product list (order/conversion pages)
  glk_txnid      — Order / transaction ID
  glk_txnvalue   — Order value (numeric)
  glk_currency   — Currency code (e.g. EUR, USD)
  glk_custom     — Custom data string

FIRING:
  Configure one GTM tag per page type, or use a single tag with dynamic
  variable values driven by the dataLayer or JavaScript variables.

GALLERY SUBMISSION:
  This template is structured according to Google Tag Manager Template Gallery
  requirements. Before submitting:
    1. Add a representative icon (PNG, 64x64px) via the Template Editor UI.
    2. Fill in the gallery metadata (category, vendor URL, support URL).
    3. Test thoroughly using GTM Preview mode across all page types.
    4. Export the final .tpl from the GTM Template Editor.

VERSION HISTORY:
  v1.0.0 — Initial release
