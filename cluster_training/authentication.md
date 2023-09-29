
# Authentication

## What is authentication

* Prove you are who you say you are

## Authentication factors

* Something you know (password)
* Something you have (cell phone, SSH key)
* Something you are (fingerprint)

## Multi-factor

* Use more than one factor, such as a password plus your cell phone (Duo)

# Authentication at the HPC core

* Some clusters use SSH keys
* Some clusters use Kerberos
* No clusters currently use campus accounts.  There are technical challenges
  preventing this, but it is something we are looking into seriously in the
  future

# Authenticaion - SSH Keys

* User generates a key pair with a public and private key
* The cluster gets your public key, you keep your private key secret
* Private key should be protected with a passphrase
* Treat the private key just like your password, ie do not re-use keys
  across authentication domains.

# Authentication - SSH Keys

## Advantages

* More secure than just a password
* agents allow passwordless login multiple times
* Same private key can be used on multiple client machines (say your laptop
  your desktop)

## Disadvantages

* If the private key is stolen, any attacker with a copy can use it, so
  please do encrypt your private key with a passphrase.
* No centralized authority to revoke a stolen key 
* Keys never expire
* If private key is lost or the passphrase forgotten, a new pair must be 
  generated, and the public key updated everywhere it is needed.

# Authenticaiton - SSH Keys

* Generate a key with the `ssh-keygen` command

More info in our knowledge base:

	https://hpc.ucdavis.edu/faq

# Authentication - Kerberos

* Developed by MIT in the 80s
* Adopted by Microsoft in the 2000s
* Most widely-used authentication system in the world

# Authentication - Kerberos

## Trusted third party model

* Your client establishes your knowledge of your passphrase with the
  KDC (kinit)
* The cluster trusts the KDC via a shared secret

## Sort of like an SSH keypair 

* But with a finite lifespan
* Can be tied to your IP
* Can be centrally revoked by the KDC

## Fall back to password authentication

More info:

	https://rcc.genomecenter.ucdavis.edu/lssc0/kerberos.html
