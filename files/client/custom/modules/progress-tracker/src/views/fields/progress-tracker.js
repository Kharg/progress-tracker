define('progress-tracker:views/fields/progress-tracker', ['views/fields/enum'], (Dep) => {
    return class extends Dep {
        type = 'progressTracker'
        detailTemplate = 'progress-tracker:views/fields/progress-tracker'
        editTemplate = 'fields/enum/edit'
        searchTemplate = 'fields/enum/search'

        setup() {
            super.setup();
            this.listenTo(this.model, 'change:' + this.name, () => {
                this.reRender();
            });
        }

        data() {
            const fieldValue = this.model.get(this.name);
            const values = this.options.options || this.params.options || [];
            const mode = this.params.mode || 'progress-tracker';
            const currentIndex = values.indexOf(fieldValue);
            const color = this.params.color || '#0f62fe';

            const modifiedValues = values.map((value, index) => {
                const label = this.getLanguage().translateOption(
                    value,
                    this.name,
                    this.model.entityType
                );

                const isComplete = index < currentIndex;
                const isActive = index === currentIndex;

                return {
                    value: value,
                    label: label,
                    isComplete: isComplete,
                    isActive: isActive,
                };
            });

            return _.extend({
                values: modifiedValues,
                mode: mode,
                color: color
            }, super.data());
        }
    };
});