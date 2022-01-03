Properties
===
***Properties(프로퍼티)*** 는 Value와 Class,Struct,Enumerate와 연결합니다.

**Stored Property**와 **Computed Properties**로 구분되며 대게 인스턴스와 연결되는 경우가 잦습니다.

Property Observer를 정의하여 Property의 값의 변경에 대한 모니터링을 하고 사용자 지정 동작에 응답할 수 있습니다.

Property Wrapper를 사용하여 여러 Property의 Getter와 Setter에서 코드 재사용이 가능합니다.

## Stored Propeties(저장된 프로퍼티)
```Stored Property```의 가장 간단한 형식은 특정 Class나 Struct의 인스턴스의 일부분으로 지정된 상수/변수 입니다.

Stored Property에 대한 기본값을 제공할 수 있으며, 초기화 중에 초기값을 설정/수정할 수 있습니다. 

### Lazy Stored Peoperties(지연 저장된 프로퍼티)
처음 사용될때까지 초기값이 계산되지 않는 프로퍼티를 의미하며, 선언전에 ```lazy``` 수정자를 붙여 나타냅니다.
> 인스턴스 초기화 완료 이후에도 초기값인 없을 경우를 대비하여 ```var```키워드를 가진 변수로 선업해야 합니다.

Lazy Properties는 프로퍼티의 초기값으로 필요할 떄까지 수행되면 안되는 복잡하거나 비용이 많이 드는 계산에 유용하게 사용됩니다.

### Stored Property와 인스턴스 변수
Property 외에도 Property에 저장된 값을 백업 저장소로 인스턴스 변수를 사요할 수 있습니다.

## Computed Properties(계산된 프로퍼티)
Class,Struct,Enum은 값을 실질적으로 저장하지 않는 ```Computed Properties```를 정의할 수 있습니다. 이때 다른 프로퍼티와 값을 간접적으로 조회하고 설정하기 위한 Getter, optional Setter를 제공합니다.

### 짧은 Getter, Setter 선언
+ Computed Property가 새로운 setter를 이름없이 정의하면 ```newValue``라는 기본 이름이 사용됩니다.
+ Computed Property의 getter가 단일 표현식일경우 암시적인 표현식을 반화합니다.

### Read-only Computed Properties
setter가 없고 getter만 있는 Computed Property를 ```read-only computed property```라고 부르며 항상 값을 반환하고 점 구문으로 접근이 가능하지만 다른 값을 설정 할 수는 없습니다.
