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
