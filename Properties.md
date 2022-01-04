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
setter가 없고 getter만 있는 Computed Property를 ```read-only computed property```라고 합니다. read-only computed propety는  항상 값을 반환하고 점 구문으로 접근이 가능하지만 다른 값을 설정 할 수는 없습니다.

## Property Observer(프로퍼티 관찰자)
**Property Observer** 는 프로퍼티의 값이 변경되는지 관찰하고 응답합니다. 프로퍼티의 현재값이 새로운 값과 같더라도 프로퍼티의 값이 설정될 때 호출됩니다.

+ 상속된 프로퍼티에서 하위 클래스의 프로퍼티를 재정의하여 프로퍼티 관찰자를 추가합니다.
+ 정의한 Computed Property의 경우 Observer를 생성하는 대신 Setter를 이용하여 값 변경을 관찰하고 응답합니다.

**Property Observer 정의 방법**
+ ```willset``` : 값이 저장되기 직전에 호출
+ ```didset``` : 새로운 값이 저장된 직후에 호출

```willset``` Observer를 구현하면 상수 파라미터로 새로운 Property값이 전달됩니다. 구현의 일부로 이 파라미터에 이름을 지정할 수 있습니다. 미지정시 기본 파라미터명 ```newValue```로 만들어 질 수 있습니다.

```didset``` Observer를 구현하면 이전 프로퍼티값을 포함한 상수 파라미터가 전달됩니다. 이름을 지정하거나 기본 파라미터명 `oldValue`로 사용 될 수 있습니다. `didset` Observer내의 프로퍼티에 값을 할당하면 새로운 값으로 방금 설정한 값을 대체합니다.

> 상위 클래스 Property의 `didset`과 `willset` Observer는 상위 클래스 초기화 호출 이후 하위 클래스 초기화에서 프로퍼티가 설정될 떄 호출 됩니다. 상위 클래스의 초기화 전 자체 프로퍼티 설정 중에는 호출 되지 않습니다.

## Property Wrappers(프로퍼티 래퍼)
**Property Wrapper**는 프로퍼티가 저장되는 방법을 관리하는 코드와 프로퍼티를 정의하는 코드 사이에 분리 계층을 추가합니다. 프로퍼티 래퍼를 사용하여 관리 코드를 한번에 작성하여 여러 프로퍼티에 적용하는 방식을 사용 할 수 있습니다.

Property Wrapper 정의를 위해 `wrappedValue` 프로퍼티를 정의한 class/struct/enum 을 생성합니다.

Property Wrapper를 적용할 때 컴파일러는 이를 위한 저장소를 제공하는 코드와 Wrapper를 통해 프로퍼티에 접근하는 코드를 합성합니다.