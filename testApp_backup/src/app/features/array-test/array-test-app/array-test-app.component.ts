import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-array-test-app',
  templateUrl: './array-test-app.component.html',
  styleUrls: ['./array-test-app.component.css']
})
export class ArrayTestAppComponent implements OnInit {

  inputNum: number;
  output: string;
  count: number;
  numArray: number[] = new Array<number>();
  outputArray: number[] = new Array<number>();
  primesArray: number[] = new Array<number>();
  evenArray: number[] = new Array<number>();
  evenArrayInvers: number[] = new Array<number>();

  enableButton: boolean;
  enableInput: boolean;
  visibleTxt: boolean;
  message: string;

  constructor() { }

  ngOnInit() {
    this.message = 'Please input minimum 15 numbers!';
    this.visibleTxt = true;
    this.enableInput = true;
    this.enableButton = false;
    this.count = 0;
  }

  process() {
    this.evenArray = new Array<number>();
    this.primesArray = new Array<number>();
    this.evenArrayInvers = new Array<number>();
    this.outputArray = new Array<number>();

    for (const num of this.numArray) {
      if (num > 1) {
        if (this.isPrime(num)) {
          this.primesArray.push(num);
        } else {
          if (num % 2 === 0) {
            this.evenArray.push(num);
          }
        }
      }
      const length = this.primesArray.length + this.evenArray.length;
      if (length === 15) {
        break;
      }
    }
    this.outputArray.push(...this.primesArray);

    for (let n = this.evenArray.length; n--;) {
      this.evenArrayInvers.push(this.evenArray[n]);
    }
    this.outputArray.push(...this.evenArrayInvers);

    if (this.outputArray.length === 15) {
      this.output = this.outputArray.join('-');
      this.enableInput = false;
      this.enableButton = false;
    } else {
      this.output = 'Input more number! Odd number is not include.';
    }
  }

  isPrime(num: number) {
    if (num === 2) {
      return true;
    } else {
      for (let i = 2; i < num; i++) {
        if (num % i === 0) {
          return false;
        }
      }
    }
    return true;
  }

  onEnter() {
    if (this.inputNum == null) {
      this.message = 'Input cannot be null!';
      this.visibleTxt = true;
      return;
    }

    this.numArray.push(this.inputNum);
    this.count++;
    if (this.count > 14) {
      this.enableButton = true;
    }

    if (this.numArray.length) {
      this.visibleTxt = false;
    }
    this.inputNum = null;
  }

  reset() {
    this.inputNum = null;
    this.numArray.length = 0;
    this.output = null;
    this.ngOnInit();
  }

}
