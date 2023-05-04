PACKAGES := $(wildcard packages/*)
FEATURES := $(wildcard packages/features/*)

print:
	@for package in $(PACKAGES); do \
		echo $$package ; \
	done
	@printf "\n"
	@for feature in $(FEATURES); do \
		echo $$feature ; \
	done

get:
	flutter pub get
	@printf "\n"
	@for package in $(PACKAGES); do \
		cd $${package} ; \
		echo "Updating dependencies on $${package}" ; \
		flutter pub get ; \
		cd ../../; \
	done
	@printf "\n"
	@for feature in $(FEATURES); do \
		cd $${feature} ; \
		echo "Updating dependencies on $${feature}" ; \
		flutter pub get ; \
		cd ../../../; \
	done

upgrade:
	flutter pub upgrade
	@printf "\n"
	@for package in $(PACKAGES); do \
		cd $${package} ; \
		echo "Upgrading dependencies on $${package}" ; \
		flutter pub upgrade ; \
		cd ../../; \
	done
	@printf "\n"
	@for feature in $(FEATURES); do \
		cd $${feature} ; \
		echo "Upgrading dependencies on $${feature}" ; \
		flutter pub upgrade ; \
		cd ../../../; \
	done

clean:
	flutter clean
	@printf "\n"
	@for package in $(PACKAGES); do \
		cd $${package} ; \
		echo "Running clean on $${package}" ; \
		flutter clean ; \
		cd ../../; \
	done
	@printf "\n"
	@for feature in $(FEATURES); do \
		cd $${feature} ; \
		echo "Running clean on $${feature}" ; \
		flutter clean ; \
		cd ../../../; \
	done

testing:
	flutter test
	@printf "\n"
	@for package in $(PACKAGES); do \
		cd $${package} ; \
		echo "Running test on $${package}" ; \
		flutter test ; \
		cd ../../; \
	done
	@printf "\n"
	@for feature in $(FEATURES); do \
		cd $${feature} ; \
		echo "Running test on $${feature}" ; \
		flutter test ; \
		cd ../../../; \
	done

lint:
	flutter analyze

format:
	dart format --set-exit-if-changed .