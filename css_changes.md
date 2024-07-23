These the things needed when updating the gov.uk css to make it work.

* add to `.govuk-back-link` for backlink
```
border: none;
background: white;
color: #0b0c0c;
```

* error summary change
```
.govuk-error-summary__list {
    color: #d4351c;
    font-weight: 700;
    text-decoration: underline;
    text-underline-offset: 0.1em
```

* add 
```
.govuk-link {
    border:none
}
```

* Move fonts css to the font css
* Change url links

* For accordion need to fix the norem by:
```
.js-enabled .govuk-accordion-nav__chevron {
    width: 20px;
    height: 20px;
    border: 1px solid;

.js-enabled .govuk-accordion-nav__chevron:after{
    bottom: 5px;
    left: 6px;
    width: 6px;
    height: 6px;
    border-top: 2px solid;
    border-right: 2px solid
}

.js-enabled .govuk-accordion__section-toggle {
  pointer-events: none;
}
```

* Change filepaths for crown copyright logo:
```
.govuk-footer__copyright-logo {
    display: inline-block;
    min-width: 125px;
    padding-top: 112px;
    background-image: url(../images/govuk-crest.png);
    background-repeat: no-repeat;
    background-position: 50% 0;
    background-size: 125px 102px;
    text-align: center;
    white-space: nowrap
}

@media only screen and (-webkit-min-device-pixel-ratio:2),
only screen and (min-resolution:192dpi),
only screen and (min-resolution:2dppx) {
    .govuk-footer__copyright-logo {
        background-image: url(../images/govuk-crest-2x.png)
    }
}
```

* Fix alignment on the radio button item labels
```
.govuk-radios__input {
    z-index: 1;
    width: 44px;
    height: 44px;
    margin: 0;
    opacity: 0;
    vertical-align: middle;
    cursor: pointer
}

.govuk-radios__label {
    align-self: center;
    max-width: calc(100% - 74px);
    display: inline-block;
    padding: 7px 15px;
    cursor: pointer;
    touch-action: manipulation
}
```

* Fix selected tab panel border gap
```
.govuk-frontend-supported .govuk-tabs__list-item--selected {
    position: relative;
    margin-top: -5px;
    margin-bottom: -2px;
    padding: 14px 19px 16px;
    border: 1px solid #b1b4b6;
    border-bottom: none;
    background-color: #fff
}
```

* govTable caption colour:

```
.govuk-table__caption {
    font-weight: 700;
    display: table-caption;
    text-align: left;
    color: #000;
}
```
