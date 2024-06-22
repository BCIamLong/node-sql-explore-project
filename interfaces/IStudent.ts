export interface StudentInput {
  Name: string;
  Email: string;
  Phone: string;
}

export default interface IStudent extends StudentInput {
  Id: number;
}
