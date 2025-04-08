# ZCIDDONC
Code Inspector Test to check DDIC Object naming

Tested in ABAP Trial 7.52 SP 04.

Transaction `SCI`

![Code Inspector Manage Tests](https://github.com/user-attachments/assets/165e4e45-5682-42e1-a55b-139908d66914)

![Code Inspector Activate Test](https://github.com/user-attachments/assets/d9d49542-2c29-4066-a68b-3aaba4173faa)

![Code Inspector Test DDIC Object Naming](https://github.com/user-attachments/assets/23e55537-3430-4695-b13d-ebbaadbcc6f5)

![Code Inspector Test DDIC Object Naming](https://github.com/user-attachments/assets/1ba2dbe7-1572-4c92-94a9-023db7267845)

![Code Inspector Test DDIC Object Naming](https://github.com/user-attachments/assets/35333519-603f-4a7e-b40b-f870e6d77cea)

Limitations:
- Lock objects are not managed yet.
- Table extension indexes won't be managed because it's too much difficult to implement, as they are part of standard tables which are not checked by Code Inspector in customer systems.
