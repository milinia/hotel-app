// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum BookingScreen {
    /// Добавить туриста
    internal static let addTourist = Strings.tr("Localizable", "bookingScreen.addTourist", fallback: "Добавить туриста")
    /// Даты
    internal static let dates = Strings.tr("Localizable", "bookingScreen.dates", fallback: "Даты")
    /// Питание
    internal static let food = Strings.tr("Localizable", "bookingScreen.food", fallback: "Питание")
    /// Вылет из
    internal static let from = Strings.tr("Localizable", "bookingScreen.from", fallback: "Вылет из")
    /// Топливный сбор
    internal static let fuelSurcharge = Strings.tr("Localizable", "bookingScreen.fuelSurcharge", fallback: "Топливный сбор")
    /// Отель
    internal static let hotel = Strings.tr("Localizable", "bookingScreen.hotel", fallback: "Отель")
    /// Кол-во ночей
    internal static let nightsCount = Strings.tr("Localizable", "bookingScreen.nightsCount", fallback: "Кол-во ночей")
    /// Оплатить
    internal static let pay = Strings.tr("Localizable", "bookingScreen.pay", fallback: "Оплатить")
    /// Номер
    internal static let room = Strings.tr("Localizable", "bookingScreen.room", fallback: "Номер")
    /// Сервисный сбор
    internal static let serviceSurcharge = Strings.tr("Localizable", "bookingScreen.serviceSurcharge", fallback: "Сервисный сбор")
    /// Бронирование
    internal static let title = Strings.tr("Localizable", "bookingScreen.title", fallback: "Бронирование")
    /// Страна, город
    internal static let to = Strings.tr("Localizable", "bookingScreen.to", fallback: "Страна, город")
    /// К оплате
    internal static let toPay = Strings.tr("Localizable", "bookingScreen.toPay", fallback: "К оплате")
    /// Тур
    internal static let tour = Strings.tr("Localizable", "bookingScreen.tour", fallback: "Тур")
    /// турист
    internal static let tourist = Strings.tr("Localizable", "bookingScreen.tourist", fallback: "турист")
    internal enum AboutCustomer {
      /// Дата рождения
      internal static let birthday = Strings.tr("Localizable", "bookingScreen.aboutCustomer.birthday", fallback: "Дата рождения")
      /// Гражданство
      internal static let citizenship = Strings.tr("Localizable", "bookingScreen.aboutCustomer.citizenship", fallback: "Гражданство")
      /// Почта
      internal static let email = Strings.tr("Localizable", "bookingScreen.aboutCustomer.email", fallback: "Почта")
      /// Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту
      internal static let info = Strings.tr("Localizable", "bookingScreen.aboutCustomer.info", fallback: "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту")
      /// Имя
      internal static let name = Strings.tr("Localizable", "bookingScreen.aboutCustomer.name", fallback: "Имя")
      /// Номер загранпаспорта
      internal static let passportNumber = Strings.tr("Localizable", "bookingScreen.aboutCustomer.passportNumber", fallback: "Номер загранпаспорта")
      /// Срок действия загранпаспорта
      internal static let passportValidityPeriod = Strings.tr("Localizable", "bookingScreen.aboutCustomer.passportValidityPeriod", fallback: "Срок действия загранпаспорта")
      /// Номер телефона
      internal static let phone = Strings.tr("Localizable", "bookingScreen.aboutCustomer.phone", fallback: "Номер телефона")
      /// Фамилия
      internal static let surname = Strings.tr("Localizable", "bookingScreen.aboutCustomer.surname", fallback: "Фамилия")
      /// Информация о покупателе
      internal static let title = Strings.tr("Localizable", "bookingScreen.aboutCustomer.title", fallback: "Информация о покупателе")
    }
  }
  internal enum HotelScreen {
    /// Об отеле
    internal static let about = Strings.tr("Localizable", "hotelScreen.about", fallback: "Об отеле")
    /// Localizable.strings
    ///   hotel-app
    /// 
    ///   Created by Evelina on 26.12.2023.
    internal static let title = Strings.tr("Localizable", "hotelScreen.title", fallback: "Отель")
    /// К выбору номера
    internal static let toRooms = Strings.tr("Localizable", "hotelScreen.toRooms", fallback: "К выбору номера")
  }
  internal enum RoomScreen {
    /// Подробнее о номере
    internal static let aboutRoom = Strings.tr("Localizable", "roomScreen.aboutRoom", fallback: "Подробнее о номере")
    /// Выбрать номер
    internal static let chooseRoom = Strings.tr("Localizable", "roomScreen.chooseRoom", fallback: "Выбрать номер")
  }
  internal enum StatusScreen {
    /// Супер!
    internal static let buttonText = Strings.tr("Localizable", "statusScreen.buttonText", fallback: "Супер!")
    /// Ваш заказ принят в работу
    internal static let statusText = Strings.tr("Localizable", "statusScreen.statusText", fallback: "Ваш заказ принят в работу")
    /// Заказ оплачен
    internal static let title = Strings.tr("Localizable", "statusScreen.title", fallback: "Заказ оплачен")
    internal enum DescriptionText {
      /// Как только мы получим ответ от туроператора, вам на почту придет уведомление.
      internal static let end = Strings.tr("Localizable", "statusScreen.descriptionText.end", fallback: "Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
      /// Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток).
      internal static let start = Strings.tr("Localizable", "statusScreen.descriptionText.start", fallback: "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток).")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
