## question: Pod won't run due to runAsNonRoot error:

While applying securityContext settings (`runAsNonRoot: true`), my pod failed with Error: container has runAsNonRoot and image will run as root

## What I expected:
I expected the image to run securely, but it defaults to root. What’s the best practice when securing containers without customizing the image manually?

## My confusion:
I understand that security is a priority but what is the use of security when it prevents pods from running?
