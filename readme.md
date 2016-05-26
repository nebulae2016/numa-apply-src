# How to add a new numa location

- make new branch
	- add location to `numa_locations.yml`
	- add location to `circle.yml` (deployment: branches: [add to array])
	- push to origin
- make prismic repo for the branch
    - set the custom types
			- numa
			- article
		- add dummy content
    - add web hook
        - [https://script.google.com/macros/s/AKfycbwqW2wSK6fAG8eq6Cls2asCnBfeozdpGeLl1MrKo1B7A4yvZw/exec](https://script.google.com/macros/s/AKfycbwqW2wSK6fAG8eq6Cls2asCnBfeozdpGeLl1MrKo1B7A4yvZw/exec)
        - secret: :location-:999999999 (9digit UID)
- Add the location & secret to [https://script.google.com/d/1ygMGtgaIATauGBMJQncwM7H4yY_5JAjM1uxKrld5Z8YZCmbIe9PPn_0M/edit?usp=drive_web](https://script.google.com/d/1ygMGtgaIATauGBMJQncwM7H4yY_5JAjM1uxKrld5Z8YZCmbIe9PPn_0M/edit?usp=drive_web)
- let alban set up the correct DNS settings

### Enjoy !
