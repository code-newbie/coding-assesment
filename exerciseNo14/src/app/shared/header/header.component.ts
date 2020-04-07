import { Component } from '@angular/core';

@Component({
    selector: 'app-header',
    template: `<div class="header-component">{{header}}</div>`,
    styleUrls: ['./header.component.css']
})
export class HeaderComponent {
    public header = 'Header';
}
