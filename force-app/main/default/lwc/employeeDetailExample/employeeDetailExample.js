import { LightningElement, track} from 'lwc';

export default class EmployeeDetailExample extends LightningElement {
@track name;
@track age;
@track salary;

nameHandler(event)
{
    this.name = event.target.value;
}
ageHandler(event)
{
    this.name = event.target.value;
}
salaryHandler(event)
{
    this.name = event.target.value;
}
}