<!--Vant 时间组件 van-datetime-picker 支持秒-->
<template>
    <div class="van-datetimesec-picker">
        <van-datetime-picker
          v-model="state.dateValue"
          type="datetime"
          v-bind="datetimePickerProps"
          
          @cancel="emits('cancel')"
          @confirm="handleConfirm"
        />
        <van-picker
          :columns="secondsColumns"
          v-bind="pickerProps"
          :default-index="state.secondIdx"
          @change="handleChange"
          :show-toolbar="false"
        />
    </div>
</template>

<script setup lang="ts">
import { PickerOption } from 'vant';
import { computed, reactive, watch } from 'vue';

    const emits = defineEmits(['update:modelValue','cancel','confirm']);
    //接收父组件消息
    const props = defineProps({
        datetimePickerProps: {
            type: Object
        },
        pickerProps: {
            type: Object
        },
        modelValue: {
            type: Date
        },
    })  

    const state = reactive({
        secondIdx: 0 as number,
        dateValue: null as Date | null,
    });

    const secondsColumns = computed(() => 
      Array(60).fill('').map((_, i) => `0${i}`.slice(-2))
    )
     
    /**
     * 点击完成按钮时触发的事件
     * @param val 当前选中的时间
     */
    const handleConfirm = (val:any) => {
        val.setSeconds(state.secondIdx)

        emits('update:modelValue', val);
        emits('confirm', val);
    }

    const handleChange = (currentValue: PickerOption, currentIndex: number) => {
        state.secondIdx = currentIndex;
    }
    
    watch(() => props.modelValue, (newVal) => {
      if (newVal) {
        state.dateValue = new Date(newVal)
        state.secondIdx = state.dateValue.getSeconds()
      }
    }, { immediate: true })
</script>

<style scoped lang="scss">
.van-datetimesec-picker {
  display: flex;
  .van-picker:first-of-type {
    flex: 5;
   
      :deep(.van-picker__toolbar) {
        width: 120%;
      }
      :deep(.van-picker__frame) {
        width: 100%;
      }
    
  }
  .van-picker:last-of-type {
    flex: 1;
    margin-top: 44px;
  }
}
</style>