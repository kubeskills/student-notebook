## Question: Pod won't run due to runAsNonRoot error:

While applying securityContext settings (`runAsNonRoot: true`), my pod failed with Error: container has runAsNonRoot and image will run as root

![image](https://github.com/user-attachments/assets/938b9c7b-760a-487a-b5ff-323f185cc965)


## What I expected:
I expected the image to run securely, but it defaults to root. What’s the best practice when securing containers without customizing the image manually?

## My confusion:
I understand that security is a priority but what is the use of security when it prevents pods from running?
