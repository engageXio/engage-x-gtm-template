# Engage-X Pixel — GTM Custom Tag Template

## Overview
This Google Tag Manager Custom Tag Template loads the **Engage-X advertising pixel** (`https://a1.engage-x.io/`) and sets all required window-level parameters before the script fires.

The template is built with GTM Sandboxed JavaScript and is structured for submission to the **Google Tag Manager Template Gallery**.

---

## Parameters

### Basic Configuration (Required)

| Field | Window Variable | Description |
|---|---|---|
| Network ID | `glk_network` | String identifying your network |
| Program ID | `glk_program` | Internal Engage-X program ID |
| Page Type | `glk_pagetype` | See page type values below |
| EU Consent Value | `glk_euconsent` | `1` or TCF string = consent given, `0` = no consent |

#### Page Type Values
| Value | Description |
|---|---|
| `START` | Homepage / Start page |
| `PRODUCT` | Single product page |
| `CATALOG` | Category / catalog page |
| `SEARCH` | Search results page |
| `WISHLIST` | Wishlist page |
| `CART` | Shopping cart page |
| `CHECKOUT` | Checkout page |
| `ORDER` | Order confirmation page |
| `CONVERSION` | Conversion / thank-you page |

---

### Product Data (Optional)

| Field | Window Variable | Description |
|---|---|---|
| Product ID | `glk_product` | Single product number (product pages) |
| Product List | `glk_txnproducts` | Comma-separated product IDs (e.g. `PROD1,PROD2,PROD3`) |

---

### Transaction Data (Optional)

| Field | Window Variable | Description |
|---|---|---|
| Order ID | `glk_txnid` | Transaction / order ID |
| Order Value | `glk_txnvalue` | Numeric value of transaction |
| Currency | `glk_currency` | Currency code, e.g. `EUR`, `USD`, `GBP` |

---

### Custom Data (Optional)

| Field | Window Variable | Description |
|---|---|---|
| Custom Data | `glk_custom` | Any custom string value |

---

## How to Install

1. Open your **Google Tag Manager** container.
2. Go to **Templates → Tag Templates → New**.
3. Click the **⋮ menu → Import** and select `engage-x-pixel.tpl`.
4. Click **Save**.
5. Create a new **Tag** and select **Engage-X Pixel** from the Custom section.
6. Fill in the required fields (Network ID, Program ID, Page Type, Consent).
7. Set the appropriate **Trigger** (e.g. Page View, DOM Ready).
8. **Preview** and test, then **Publish**.

---

## Usage by Page Type

### Homepage (START)
```
Network ID:   your-network
Program ID:   your-program-id
Page Type:    START
EU Consent:   1
```

### Product Page (PRODUCT)
```
Network ID:   your-network
Program ID:   your-program-id
Page Type:    PRODUCT
Product ID:   {{dlv - product_id}}
EU Consent:   {{dlv - consent}}
```

### Order Confirmation (ORDER / CONVERSION)
```
Network ID:    your-network
Program ID:    your-program-id
Page Type:     ORDER
Order ID:      {{dlv - order_id}}
Order Value:   {{dlv - order_value}}
Currency:      EUR
Product List:  {{dlv - product_ids}}   ← comma-separated e.g. PROD1,PROD2
EU Consent:    {{dlv - consent}}
```

---

## Consent Handling

The template **does not perform any internal consent check**. It accepts whatever value is passed into the `EU Consent Value` field and forwards it directly to `window.glk_euconsent`. Consent logic should be handled externally (e.g. via a GTM Consent Mode trigger or CMP integration) before this tag fires.

---

## Permissions

The template declares the following GTM permissions:

| Permission | Detail |
|---|---|
| `inject_script` | Allowed URL: `https://a1.engage-x.io/` |
| `access_globals` (write) | All `glk_*` window variables listed above |

---

## Gallery Submission Checklist

Before submitting to the GTM Template Gallery:

- [ ] Add a 64×64 px PNG icon in the Template Editor
- [ ] Fill in vendor URL and support/contact URL in gallery metadata
- [ ] Select the appropriate category (e.g. **Advertising**)
- [ ] Test all page types in GTM Preview mode
- [ ] Verify all `glk_*` variables are set correctly in the browser console
- [ ] Export final `.tpl` file from the GTM Template Editor

---

## Version History

| Version | Notes |
|---|---|
| 1.0.0 | Initial release |

---

*Template developed for Engage-X advertising pixel integration via Google Tag Manager.*
