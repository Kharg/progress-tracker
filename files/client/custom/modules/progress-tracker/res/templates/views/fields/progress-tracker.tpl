<ol class="dds__progress-tracker{{#ifEqual mode 'progress-tracker-sm'}}--sm{{/ifEqual}}{{#ifEqual mode 'progress-tracker-md'}}--md{{/ifEqual}}" style="--tracker-color: {{color}};">
    {{#each values}}
        <li class="dds__progress-tracker__item
            {{#if isComplete}}dds__progress-tracker--complete
            {{else if isActive}}
                {{#if @last}}dds__progress-tracker--complete{{else}}dds__progress-tracker--in-progress{{/if}}
            {{else if @last}}dds__progress-tracker--active
            {{/if}}"
            aria-current="{{#if isActive}}true{{else}}false{{/if}}">

            {{#if isComplete}}
                <span class="dds__sr-only">complete</span>
            {{else if isActive}}
                {{#if @last}}
                    <span class="dds__sr-only">complete</span>
                {{else}}
                    <span class="dds__sr-only">in progress</span>
                {{/if}}
            {{else if @last}}
                <span class="dds__sr-only">active</span>
            {{else}}
                <span class="dds__sr-only">inactive</span>
            {{/if}}

            <span class="dds__progress-tracker__circle">
                <span class="dds__progress-tracker__icon"></span>
            </span>
            <div class="dds__progress-tracker__content">
                <span class="dds__progress-tracker__step-name">{{label}}</span>
            </div>
        </li>
    {{/each}}
</ol>